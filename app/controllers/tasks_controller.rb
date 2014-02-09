class TasksController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  before_filter :authorize, :only => [:destroy]
  include WorkobjectsHelper
  include TasksHelper
  include Sms::SendSmsHelper
  helper_method :sort_column, :sort_direction



  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = if current_staff.admin?
     Task.joins("left join staffs ss1 on ss1.id=tasks.staff_id").joins("left join staffs ss2 on ss2.id=tasks.staff_from_id").joins("left join workobjects wo on wo.id=tasks.workobject_id").select("tasks.id id,tasks.description description,wo.id wo_id,wo.name || ', '||wo.city||', '||wo.address wo_fulladdr,ss2.lname || ' ' || ss2.fname from_name,ss1.lname || ' ' || ss1.fname to_name,tasks.sdate,tasks.edate,tasks.progress,tasks.state,tasks.priority").search(params[:search]).order(sort_column + " " + sort_direction)
        else
     Task.joins("left join staffs ss1 on ss1.id=tasks.staff_id").joins("left join staffs ss2 on ss2.id=tasks.staff_from_id").joins("left join workobjects wo on wo.id=tasks.workobject_id").select("tasks.id id,tasks.description,wo.id wo_id,wo.name || ', '||wo.city||', '||wo.address wo_fulladdr,ss2.lname || ' ' || ss2.fname from_name,ss1.lname || ' ' || ss1.fname to_name,tasks.sdate,tasks.edate,tasks.progress,tasks.state,tasks.priority").where(staff_id: current_staff.id).search(params[:search]).order(sort_column + " " + sort_direction + ",priority desc")
  end
      respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = Task.find(params[:id])
logger.debug "!!!!!!!!!!!!!!!!!!"+@task.inspect
    @task.update_attribute(:state, "2run") if @task.state=="3new" && current_staff.id==@task.staff_id
    task_deleg_f = TaskDelegate.where(task_id: @task.id).first
    @staff_from_fullname = Staff.exists?(@task.staff_from_id) ? Staff.find(@task.staff_from_id).fullname : ""
    @wo_fulladdr =  @task.workobject_id.nil? ?  "" : Workobject.find(@task.workobject_id).fulladdr
    @post = Post.new
    @upload = Upload.new
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @task = Task.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(params[:task])
    @task.staff_from_id = current_staff.id
    @task.state = "3new"

    respond_to do |format|
      if @task.save
        task_delegate = TaskDelegate.new
        task_delegate.staff_from = current_staff.id
        task_delegate.staff_to = params[:task]["staff_id"]
        task_delegate.task_id = @task.id
        task_delegate.when = Time.now
        if task_delegate.save
          Mailer.task_notification(Staff.find(params[:task]["staff_id"]),Staff.find(current_staff.id),@task).deliver
          sms_state = send_sms(Staff.find(task_delegate.staff_to),Staff.find(task_delegate.staff_from),@task.id) =~ /100/ ? "SMS send Ok" : "SMS not send"
          format.html { redirect_to @task, notice: 'Task was successfully created.<br>'+sms_state }
          format.json { render json: @task, status: :created, location: @task }
        else
          format.html { render action: "new" }
          format.json { render json: @task.errors, status: :unprocessable_entity }
        end
      else
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @task = Task.find(params[:id])
#    @task.staff_from_id = current_staff.id
    old_staff_id = @task.staff_id.nil? ? 0 : @task.staff_id
logger.debug "===== #{@task.staff_id.inspect} ====="
logger.debug "===== #{params[:task]["staff_id"].inspect} ====="
    respond_to do |format|
      if @task.update_attributes(params[:task])
        if !params[:task]["staff_id"].nil? && old_staff_id.to_i != params[:task]["staff_id"].to_i
          task_delegate = TaskDelegate.new
          task_delegate.staff_from = current_staff.id
          task_delegate.staff_to = params[:task]["staff_id"]
          task_delegate.task_id = @task.id
          task_delegate.when = Time.now
          Mailer.task_notification(Staff.find(task_delegate.staff_to),Staff.find(task_delegate.staff_from),@task)
          if task_delegate.save
            sms_state = send_sms(Staff.find(task_delegate.staff_to),Staff.find(task_delegate.staff_from),@task.id) =~ /100/ ? "SMS send Ok" : "SMS not send"
            format.html { redirect_to @task, notice: 'Task was successfully updated.<br>'+sms_state }
            format.json { head :no_content }
          else
            format.html { render action: "edit" }
            format.json { render json: @task.errors, status: :unprocessable_entity }
          end
        else
          format.html { redirect_to @task, notice: 'Task was successfully updated.' }
          format.json { head :no_content }
        end
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = Task.find(params[:id])
    if current_staff.admin?
      @task.destroy
      end
      respond_to do |format|
        format.html { redirect_to tasks_url }
        format.json { head :no_content }
      end
    end
  end

  private
    def record_not_found
     write_attribute(:description," ")
     write_attribute(:workobject_id,0)
    end
  def sort_column
    ["description","workobject_id","from_name","to_name","sdate","edate","progress","state","priority"].include?(params[:sort]) ? params[:sort] : "id"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end

