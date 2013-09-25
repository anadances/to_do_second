class List < ActiveRecord::Base
  validates :name, :presence => true
  has_many :tasks

  def done_tasks
    done_tasks = []
    self.tasks.each do |task|
      if task.done 
        done_tasks << task
      end
    end
    done_tasks
  end

  def not_done_tasks
    not_done_tasks = []
    self.tasks.each do |task|
      unless task.done 
        not_done_tasks << task
      end
    end
    not_done_tasks
  end
end