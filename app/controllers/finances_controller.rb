class FinancesController < ApplicationController
  # GET /finances
  # GET /finances.json
  include FinancesHelper
  def index
    @finances = Finance.joins("left join workobjects wo on wo.id=finances.workobject_id").joins("left join staffs ss1 on ss1.id=finances.staff_id").select("finances.id id,wo.name || ', '||wo.city||', '||wo.address wo_full,ss1.lname || ' ' || ss1.fname staff_full,finances.cost_type cost_type,finances.fin_item fin_item,finances.staff_item staff_item,finances.summa,finances.d1,finances.d2,finances.remark,finances.invoice").search(params[:search]).order(sort_column + " " + sort_direction)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @finances }
    end
  end

  # GET /finances/1
  # GET /finances/1.json
  def show
    @finance = Finance.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @finance }
    end
  end

  # GET /finances/new
  # GET /finances/new.json
  def new
    @finance = Finance.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @finance }
    end
  end

  # GET /finances/1/edit
  def edit
    @finance = Finance.find(params[:id])
  end

  # POST /finances
  # POST /finances.json
  def create
    @finance = Finance.new(params[:finance])

    respond_to do |format|
      if @finance.save
        format.html { redirect_to finances_url, notice: 'Finance was successfully created.' }
        format.json { render json: finances_url, status: :created, location: @finance }
      else
        format.html { render action: "new" }
        format.json { render json: @finance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /finances/1
  # PUT /finances/1.json
  def update
    @finance = Finance.find(params[:id])

    respond_to do |format|
      if @finance.update_attributes(params[:finance])
        format.html { redirect_to finances_url, notice: 'Finance was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @finance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /finances/1
  # DELETE /finances/1.json
  def destroy
    @finance = Finance.find(params[:id])
    @finance.destroy

    respond_to do |format|
      format.html { redirect_to finances_url }
      format.json { head :no_content }
    end
  end

end
