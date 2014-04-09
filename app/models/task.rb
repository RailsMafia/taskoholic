class Task < ActiveRecord::Base
  belongs_to :project
  belongs_to :user

  validates_associated :project
  validates :name, presence: true, length: {minimum: 2, maximum: 50}
  validates :description, length: {maximum: 1000}
end
