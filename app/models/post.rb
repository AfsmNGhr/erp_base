class Post < ActiveRecord::Base
  belongs_to :task
  belongs_to :staff
  belongs_to :workobject
  attr_accessible :staff_id, :text, :workobject_id, :task_id
  validates :staff_id, presence: true
  validates :text, presence: true
end
