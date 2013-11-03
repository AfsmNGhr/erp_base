class Staff < ActiveRecord::Base
  attr_accessible :birthday, :fname, :lname, :mname, :passport, :position, :skill, :login, :password, :email, :phone1, :phone2
#  validates :birthday, presence: true
  validates :fname, presence: true
  validates :lname, presence: true
#  validates :mname, presence: true
#  validates :passport, presence: true
#  validates :position, presence: true
#  validates :skill, presence: true
  def fullname
     res=read_attribute(:lname)+" "+read_attribute(:fname)+" "+read_attribute(:mname)
     res+=", "+read_attribute(:position) unless read_attribute(:position).empty?
     res
  end
end
