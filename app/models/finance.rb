class Finance < ActiveRecord::Base
  attr_accessible :cost_type, :fin_item, :staff_id, :staff_item, :workobject_id, :summa, :d1, :d2, :remark, :invoice

  def self.search(search)
    if search
      where('wo_full LIKE ? OR staff_full LIKE ? OR cost_type LIKE ? OR fin_item LIKE ? OR staff_item like ? OR remark like ? OR invoice like ?', "%#{search}%","%#{search}%","%#{search}%","%#{search}%","%#{search}%","%#{search}%","%#{search}%")
    else
      scoped
    end
  end

end
