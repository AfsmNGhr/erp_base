class PaymentcashesController < ApplicationController
  load_and_authorize_resource
  # GET /paymentcashes
  # GET /paymentcashes.json
  def index
    @paymentcashes = Paymentcash.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @paymentcashes }
    end
  end

  # GET /paymentcashes/1
  # GET /paymentcashes/1.json
  def show
    @paymentcash = Paymentcash.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @paymentcash }
    end
  end

  # GET /paymentcashes/new
  # GET /paymentcashes/new.json
  def new
    @paymentcash = Paymentcash.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @paymentcash }
    end
  end

  # GET /paymentcashes/1/edit
  def edit
    @paymentcash = Paymentcash.find(params[:id])
  end

  # POST /paymentcashes
  # POST /paymentcashes.json
  def create
    @paymentcash = Paymentcash.new(params[:paymentcash])

    respond_to do |format|
      if @paymentcash.save
        format.html { redirect_to @paymentcash, notice: 'Paymentcash was successfully created.' }
        format.json { render json: @paymentcash, status: :created, location: @paymentcash }
      else
        format.html { render action: "new" }
        format.json { render json: @paymentcash.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /paymentcashes/1
  # PUT /paymentcashes/1.json
  def update
    @paymentcash = Paymentcash.find(params[:id])

    respond_to do |format|
      if @paymentcash.update_attributes(params[:paymentcash])
        format.html { redirect_to @paymentcash, notice: 'Paymentcash was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @paymentcash.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /paymentcashes/1
  # DELETE /paymentcashes/1.json
  def destroy
    @paymentcash = Paymentcash.find(params[:id])
    @paymentcash.destroy

    respond_to do |format|
      format.html { redirect_to paymentcashes_url }
      format.json { head :no_content }
    end
  end
end
