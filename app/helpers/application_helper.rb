# -*- encoding : utf-8 -*-
module ApplicationHelper
  def task_status_hash
    Hash['3new','Новая','2run','Выполняется','1end','Выполнена']
  end

  def task_priority_hash
    Hash['current','Текущая','burn','Горящая']
  end
end
