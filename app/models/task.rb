class Task < ActiveRecord::Base
  validates :name, :presence => true
  belongs_to :list
  after_initialize :set_not_done

  private
  def set_not_done
    self.done ||= false
  end
end