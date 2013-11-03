class WorkobjectsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  before_filter :authorize, :except => [:index, :show]

  # GET /workobjects
  # GET /workobjects.json
  def index
    @workobjects = Workobject.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @workobjects }
    end
  end

  # GET /workobjects/1
  # GET /workobjects/1.json
  def show
    @workobject = Workobject.find(params[:id])
    @wo_tasks = Task.where(workobject_id: params[:id])
    @wo_staff = Staffobjectjournal.where(workobject_id: params[:id])
    @wo_post = Post.where(workobject_id: params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @workobject }
    end
  end

  # GET /workobjects/new
  # GET /workobjects/new.json
  def new
    @workobject = Workobject.new
    @workobject.latitude = params[:latitude]
    @workobject.longtitude = params[:longtitude]
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @workobject }
    end
  end

  # GET /workobjects/1/edit
  def edit
    @workobject = Workobject.find(params[:id])
  end

  # POST /workobjects
  # POST /workobjects.json
  def create
    @workobject = Workobject.new(params[:workobject])

    respond_to do |format|
      if @workobject.save
        format.html { redirect_to @workobject, notice: 'Workobject was successfully created.' }
        format.json { render json: @workobject, status: :created, location: @workobject }
      else
        format.html { render action: "new" }
        format.json { render json: @workobject.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /workobjects/1
  # PUT /workobjects/1.json
  def update
    @workobject = Workobject.find(params[:id])

    respond_to do |format|
      if @workobject.update_attributes(params[:workobject])
        format.html { redirect_to @workobject, notice: 'Workobject was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @workobject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workobjects/1
  # DELETE /workobjects/1.json
  def destroy
    @workobject = Workobject.find(params[:id])
    @workobject.destroy

    respond_to do |format|
      format.html { redirect_to workobjects_url }
      format.json { head :no_content }
    end
  end

  private
    def record_not_found
      write_attribute(:description," ")
      write_attribute(:workobject_id,0)
    end
end
