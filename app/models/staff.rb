class Staff < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :password, :password_confirmation, :remember_me,
                  :birthday, :fname, :lname, :mname, :passport, :position,
                  :skill, :login, :email, :phone1, :phone2, :role
#  validates :birthday, presence: true
  validates :fname, presence: true
  validates :lname, presence: true
  validates :mname, presence: true
#  validates :passport, presence: true
#  validates :position, presence: true
#  validates :skill, presence: true

  validates_presence_of :login
  validates_uniqueness_of :login, :email, :case_sensitive => false

  def fullname
     res=read_attribute(:lname)+" "+read_attribute(:fname)+" "+read_attribute(:mname)
     res+=" "+read_attribute(:position) unless read_attribute(:position).nil?
     res
  end
end

