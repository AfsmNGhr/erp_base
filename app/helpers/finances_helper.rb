# -*- encoding : utf-8 -*-
module FinancesHelper
 def sort_column
    ["wo_full","staff_full","cost_type","fin_item","staff_item","summa"].include?(params[:sort]) ? params[:sort] : "id"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end

  def sortable(column, title = nil,search)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction, :search => search}, {:class => css_class}
  end

  def cost_type_array
    %w[Финансы Кадры]
  end

  def fin_item_array
    ["Расчет субподряда","Командировочные","Транспортные расходы","Проживание","Оборудование","Аванс","Кредит","зп.выплата","Премия","Услуги","товары/материалы","Аванс подрядчику","аренда помещения/офиса","Разное","связь мобил","Коммунальные услуги"]
  end
end
