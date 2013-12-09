class TaskDelegate < ActiveRecord::Base
  attr_accessible :staff_from, :staff_to, :task_id, :when
end
