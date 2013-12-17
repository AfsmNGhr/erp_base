# -*- encoding : utf-8 -*-
module ApplicationHelper

  def task_status_hash
    Hash['new','Новая','run','Выполняется','end','Выполнена']
  end

  def task_priority_hash
    Hash['current','Текущая','burn','Горящая']
  end

  def current_user
    @current_user = @current_staff
  end

  def role
    self.roles.find_by_name(role.to_s)
  end
end
