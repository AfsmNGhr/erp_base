class Paymentcash < ActiveRecord::Base
  belongs_to :staff
  attr_accessible :how_many, :staff_id, :when
  validates :when, presence: true
  validates :staff_id, presence: true
  validates :how_many, presence: true
end
