class Project < ActiveRecord::Base
  resourcify

  has_and_belongs_to_many :users
  has_many :tasks
  belongs_to :owner,
    class_name: "User"

  scope :owned, ->(user) { where(owner_id: user.id) }

  validates_associated :owner
  validates :name, presence: true, length: {minimum: 2, maximum: 50}
  validates :owner, presence: true
  validates :description, length: {minimum: 10, maximum: 1000}
  
  def assign_user(user)
    self.users << user
  end
end
