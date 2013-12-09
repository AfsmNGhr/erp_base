# -*- encoding : utf-8 -*-

class Staffobjectjournal < ActiveRecord::Base
  belongs_to :staff
  belongs_to :workobject
  attr_accessible :edate, :sdate, :staff_id, :workobject_id, :status
  validates :edate, presence: true
  validates :sdate, presence: true
  validates :staff_id, presence: true
  validates :workobject_id, presence: true
  validates :status, presence: true

  validate do |rec|
    if Staffobjectjournal.where(["not id=? And staff_id=? And ((sdate<? And edate>?) or (sdate<? And edate>?))",rec.id,rec.staff_id,rec.sdate,rec.sdate,rec.edate,rec.edate]).count >0
      rec.errors[:base] << "Пересечение с существующими датами"
    end
  end
end
