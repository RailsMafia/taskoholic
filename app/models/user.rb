class User < ActiveRecord::Base
  validates :name, presence: true, length: {maximum: 50}
  validates :email, presence: true, uniqueness: { case_sensitive: false }

  before_save { email.downcase! }

  has_secure_password
  validates :password, length: { minimum: 6 }
  has_and_belongs_to_many :projects
  has_many :tasks
  def own_projects
	Project.find_by(owner_id: self.id)
  end
end
