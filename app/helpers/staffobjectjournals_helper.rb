# -*- encoding : utf-8 -*-
module StaffobjectjournalsHelper
  def staff_obj_status_hash
    Hash["worked","Работал","absence","Прогул","sick","Больничный","leave","Отпуск"]
  end
 
  def staff_obj_status_collect
    [["Работал","worked"],["Прогул","absence"],["Больничный","sick"],["Отпуск","leave"]]
  end
end
