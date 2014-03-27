class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, presence: true, length: {maximum: 50}
  validates :email, presence: true,
                    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ },
                    uniqueness: { case_sensitive: false }

  before_save { email.downcase! }

  has_secure_password
  validates :password, length: { minimum: 6 }

  has_and_belongs_to_many :projects
  has_many :tasks
  def own_projects
    Project.where(owner_id: self.id)
  end
end
