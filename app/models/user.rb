class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         
  validates :username, presence: true, uniqueness: true
         
  has_many :sites, dependent: :destroy
  
  before_save :set_default_role
  
  ratyrate_rater

  def role?(role_name)
    role == role_name
  end

  private
  def set_default_role
    self.role ||= "user"
  end
end
