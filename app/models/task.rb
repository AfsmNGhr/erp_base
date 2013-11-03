class Task < ActiveRecord::Base
  after_initialize :default_values
  has_many :staff_task_journals, dependent: :destroy
  has_many :posts, dependent: :destroy
  attr_accessible :workobject_id, :description, :edate, :progress, :sdate, :state, :staff_id, :staff_from_id
  validates :description, presence: true
  validates :staff_id, presence: true
  validates :staff_from_id, presence: true


 
  def fullname
     wf = read_attribute(:workobject_id).nil? ? " " : Workobject.find(read_attribute(:workobject_id)).fulladdr
     read_attribute(:description)+", "+wf
  end

  def default_values
    self.state = "new" if self.state.nil? || self.state.empty?
  end
end
