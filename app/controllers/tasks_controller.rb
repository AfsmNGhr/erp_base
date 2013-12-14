class TasksController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  load_and_authorize_resource :only => [:destroy]
  include WorkobjectsHelper
  include TasksHelper
  helper_method :sort_column, :sort_direction

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.order(sort_column + " " + sort_direction)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = Task.find(params[:id])
    task_deleg_f = TaskDelegate.where(task_id: @task.id).first
    @staff_from_fullname = if task_deleg_f.nil?
                             ""
                           else
                             Staff.exists?(task_deleg_f.staff_from) ? Staff.find(task_deleg_f.staff_from).fullname : ""
                           end
    @wo_fulladdr =  @task.workobject_id.nil? ?  "" : Workobject.find(@task.workobject_id).fulladdr
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
    @task.staff_from_id = @staff_login.id
    @task.state = "new"

    respond_to do |format|
      if @task.save
        task_delegate = TaskDelegate.new
        task_delegate.staff_from = @staff_login.id
        task_delegate.staff_to = params[:task]["staff_id"]
        task_delegate.task_id = @task.id
        task_delegate.when = Time.now
        if task_delegate.save
          Mailer.task_notification(Staff.find(params[:task]["staff_id"]),Staff.find(@staff_login.id),@task).deliver
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
    @task.staff_from_id = @staff_login.id
    old_staff_id = @task.staff_id.nil? ? 0 : @task.staff_id
logger.debug "===== #{@task.staff_id.inspect} ====="
logger.debug "===== #{params[:task]["staff_id"].inspect} ====="
    respond_to do |format|
      if @task.update_attributes(params[:task])
        if !params[:task]["staff_id"].nil? && old_staff_id.to_i != params[:task]["staff_id"].to_i
          task_delegate = TaskDelegate.new
          task_delegate.staff_from = @staff_login.id
          task_delegate.staff_to = params[:task]["staff_id"]
          task_delegate.task_id = @task.id
          task_delegate.when = Time.now
#          Mailer.task_notification(Staff.find(task_delegate.staff_to),Staff.find(task_delegate.staff_from),@task)
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

    if admin? 
      @task.destroy
      respond_to do |format|
        format.html { redirect_to tasks_url }
        format.json { head :no_content }
      end
    end
  end

  private
    def record_not_found
#      write_attribute(:description," ")
#      write_attribute(:workobject_id,0)
    end
  def sort_column
    Task.column_names.include?(params[:sort]) ? params[:sort] : "sdate"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
