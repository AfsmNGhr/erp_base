# -*- encoding : utf-8 -*-
class Mailer < ActionMailer::Base
  default from: "apella-rus@yandex.ru"
  def task_notification(staff_to,staff_from,task)
    @staff_to = staff_to
    @staff_from = staff_from
    @task = task
    mail(to: staff_to.email, subject: "Поступила новая задача")
  end

  def not_found_report(wo)
    @wo=wo
    mail(to: "de@cettex.ru", subject: "Отсутствует отчет")
  end
end
