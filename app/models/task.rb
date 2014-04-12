class Task < ActiveRecord::Base
  resourcify

  belongs_to :project
  belongs_to :user

  validates_associated :project
  validates :name, presence: true, length: {minimum: 2, maximum: 50}
  validates :description, length: {maximum: 1000}

  def late?
    !self.due_date.nil? && self.due_date < Time.now
  end
end
