class Task < ActiveRecord::Base

  validates :description, :task_list_id, presence: true

end