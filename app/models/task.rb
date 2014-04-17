class Task < ActiveRecord::Base
  resourcify

  belongs_to :project
  belongs_to :user

  validates_associated :project
  validates :name, presence: true, length: {minimum: 2, maximum: 50}
  validates :description, length: {maximum: 1000}

  validates_datetime :due_date, allow_nil: true

  def late?
    self.due_date.present? && self.due_date < Time.now
  end
end
