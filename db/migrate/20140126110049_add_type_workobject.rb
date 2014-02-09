# -*- encoding : utf-8 -*-
class AddTypeWorkobject < ActiveRecord::Migration
  def up
    add_column :workobjects, :type_wo, :string, :default =>"Объект заказчика"
  end

  def down
  end
end
