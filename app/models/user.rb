class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :projects
  has_many :own_projects, class_name: "Project", foreign_key: 'owner_id'
  has_many :tasks
  validates :email, uniqueness: true

end
