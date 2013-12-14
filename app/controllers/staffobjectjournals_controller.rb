class StaffobjectjournalsController < ApplicationController
  #before_filter :authorize, :except => [:index, :show]
  # GET /staffobjectjournals
  # GET /staffobjectjournals.json
  def index
    @staffobjectjournals = Staffobjectjournal.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @staffobjectjournals }
    end
  end

  # GET /staffobjectjournals/1
  # GET /staffobjectjournals/1.json
  def show
    @staffobjectjournal = Staffobjectjournal.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @staffobjectjournal }
    end
  end

  # GET /staffobjectjournals/new
  # GET /staffobjectjournals/new.json
  def new
    @staffobjectjournal = Staffobjectjournal.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @staffobjectjournal }
    end
  end

  # GET /staffobjectjournals/1/edit
  def edit
    @staffobjectjournal = Staffobjectjournal.find(params[:id])
  end

  # POST /staffobjectjournals
  # POST /staffobjectjournals.json
  def create
    @staffobjectjournal = Staffobjectjournal.new(params[:staffobjectjournal])

    respond_to do |format|
      if @staffobjectjournal.save
        format.html { redirect_to @staffobjectjournal, notice: 'Staffobjectjournal was successfully created.' }
        format.json { render json: @staffobjectjournal, status: :created, location: @staffobjectjournal }
      else
        format.html { render action: "new" }
        format.json { render json: @staffobjectjournal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /staffobjectjournals/1
  # PUT /staffobjectjournals/1.json
  def update
    @staffobjectjournal = Staffobjectjournal.find(params[:id])

    respond_to do |format|
      if @staffobjectjournal.update_attributes(params[:staffobjectjournal])
        format.html { redirect_to @staffobjectjournal, notice: 'Staffobjectjournal was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @staffobjectjournal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /staffobjectjournals/1
  # DELETE /staffobjectjournals/1.json
  def destroy
    @staffobjectjournal = Staffobjectjournal.find(params[:id])
    @staffobjectjournal.destroy

    respond_to do |format|
      format.html { redirect_to staffobjectjournals_url }
      format.json { head :no_content }
    end
  end
end
