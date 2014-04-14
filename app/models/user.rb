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
  def self.has_no_project(project_id)
     join = "LEFT OUTER JOIN projects_users AS pu ON pu.user_id = users.id AND pu.project_id = " + project_id.to_s
     self.joins(join).where('pu.project_id' => nil)
  end
end
