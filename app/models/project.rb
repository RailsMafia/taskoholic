class Project < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :tasks
  belongs_to :owner,
    class_name: "User"

  validates_associated :owner
  validates :name, presence: true, length: {minimum: 2, maximum: 50}
  validates :owner, presence: true
  validates :description, length: {minimum: 10, maximum: 1000}
end
