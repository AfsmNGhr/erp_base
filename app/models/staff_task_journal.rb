class StaffTaskJournal < ActiveRecord::Base
  belongs_to :staff
  belongs_to :task
  attr_accessible :edate, :sdate, :staff_id, :task_id
  validates :edate, presence: true
  validates :sdate, presence: true
  validates :staff_id, presence: true
  validates :task_id, presence: true
end
