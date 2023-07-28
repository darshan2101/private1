class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:trackable
  has_many :projects, dependent: :destroy
  has_many :chatroom_users
  has_many :chatrooms,through: :chatroom_users
  has_many :messages
  belongs_to :role ,optional: true
  before_save :assign_role
  has_and_belongs_to_many :expertises
  has_many :addresses, dependent: :destroy, inverse_of: :user
  accepts_nested_attributes_for :addresses,:allow_destroy => true, :reject_if => :all_blank
  paginates_per(10)
  # validates :dateOfBirth, presence: true 
  validates :fName, presence: true 
  validates :lName, presence: true 
  validates :gender, presence: true 
  

  def assign_role
    self.role = Role.find_by name: "Regular" if role.nil?
  end
  def admin?
    role.name == 'Admin'
  end
  def programmer?
    role.name == 'Programmer'
  end
  
  def regular?
    role.name == 'Regular'
  end

  def self.ransackable_attributes(auth_object = nil)
    [ "fName", "lName" ]
  end
  def self.ransackable_associations(auth_object = nil)
    [ "fName", "lName" ]
  end

  def username
    self.email.split("@").first
  end

end
