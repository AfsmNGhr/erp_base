# -*- encoding : utf-8 -*-
module ApplicationHelper
  def admin?
    [16,22,26].include?(@staff_login.id.to_i)
  end

  def task_status_hash
    Hash['new','Новая','run','Выполняется','end','Выполнена']
  end

end
