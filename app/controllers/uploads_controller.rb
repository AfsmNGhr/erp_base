class UploadsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  #before_filter :authorize, :except => [:index, :show, :new, :createa, :upload]

  # GET /uploads
  # GET /uploads.json
  def index
    @uploads = Upload.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @uploads }
    end
  end

  # GET /uploads/1
  # GET /uploads/1.json
  def show
    @upload = Upload.find(params[:id])
    directory = "uploads/#{@upload.workobject_id}"
    directory = "uploads_task/#{@upload.task_id}" unless @upload.task_id.nil?
    path = File.join(directory, @upload.filename)
    send_file path, :type => "Content-Type", :disposition => 'attachment; filename='+@upload.filename

#    respond_to do |format|
#      format.html # show.html.erb
#      format.json { render json: @upload }
#    end
  end

  # GET /uploads/new
  # GET /uploads/new.json
  def new
    @upload = Upload.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @upload }
    end
  end

  # GET /uploads/1/edit
  def edit
    @upload = Upload.find(params[:id])
  end

  def create
    @upload = Upload.new(params[upload])

    respond_to do |format|
      if @upload.save
        format.html {
          render :json => [@upload.to_jq_upload].to_json,
          :content_type => 'text/html',
          :layout => false
        }
        format.json { render json: {files: [@upload.to_jq_upload]}, status: :created, location: @upload }
      else
        format.html { render action: "new" }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /uploads
  # POST /uploads.json
  def upload
    upld = Upload.new
    upld.rrr_upload(params[:filename],params[:uploads],@staff_login.id)
    respond_to do |format|
      format.html { redirect_to params[:ref], notice: 'Upload was successfully created.' }
#action: 'index', status: 303 
    end
  end

  # PUT /uploads/1
  # PUT /uploads/1.json
  def update
    @upload = Upload.find(params[:id])

    respond_to do |format|
      if @upload.update_attributes(params[:upload])
        format.html { redirect_to @upload, notice: 'Upload was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /uploads/1
  # DELETE /uploads/1.json
  def destroy
    @upload = Upload.find(params[:id])
    @upload.destroy
    respond_to do |format|
      format.html { redirect_to uploads_url }
      format.json { head :no_content }
    end
  end

  private
    def record_not_found
      write_attribute(:filename," ")
      write_attribute(:workobject_id,0)
    end

end
