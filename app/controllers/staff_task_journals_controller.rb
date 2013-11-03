class StaffTaskJournalsController < ApplicationController
  # GET /staff_task_journals
  # GET /staff_task_journals.json
  def index
    @staff_task_journals = StaffTaskJournal.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @staff_task_journals }
    end
  end

  # GET /staff_task_journals/1
  # GET /staff_task_journals/1.json
  def show
    @staff_task_journal = StaffTaskJournal.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @staff_task_journal }
    end
  end

  # GET /staff_task_journals/new
  # GET /staff_task_journals/new.json
  def new
    @staff_task_journal = StaffTaskJournal.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @staff_task_journal }
    end
  end

  # GET /staff_task_journals/1/edit
  def edit
    @staff_task_journal = StaffTaskJournal.find(params[:id])
  end

  # POST /staff_task_journals
  # POST /staff_task_journals.json
  def create
    @staff_task_journal = StaffTaskJournal.new(params[:staff_task_journal])

    respond_to do |format|
      if @staff_task_journal.save
        format.html { redirect_to @staff_task_journal, notice: 'Staff task journal was successfully created.' }
        format.json { render json: @staff_task_journal, status: :created, location: @staff_task_journal }
      else
        format.html { render action: "new" }
        format.json { render json: @staff_task_journal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /staff_task_journals/1
  # PUT /staff_task_journals/1.json
  def update
    @staff_task_journal = StaffTaskJournal.find(params[:id])

    respond_to do |format|
      if @staff_task_journal.update_attributes(params[:staff_task_journal])
        format.html { redirect_to @staff_task_journal, notice: 'Staff task journal was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @staff_task_journal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /staff_task_journals/1
  # DELETE /staff_task_journals/1.json
  def destroy
    @staff_task_journal = StaffTaskJournal.find(params[:id])
    @staff_task_journal.destroy

    respond_to do |format|
      format.html { redirect_to staff_task_journals_url }
      format.json { head :no_content }
    end
  end
end
