class Workobject < ActiveRecord::Base
  has_many :staffobjectjournals, dependent: :destroy
  attr_accessible :address, :city, :latitude, :longtitude, :name, :staff_id, :region, :complete, :status
  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :latitude, presence: true
  validates :longtitude, presence: true
  validates :staff_id, presence: true
  def fulladdr
    read_attribute(:name)+", "+read_attribute(:city)+", "+read_attribute(:address)
  end
end
