# -*- encoding : utf-8 -*-
require 'net/http'
require 'cgi'

module Sms::SendSmsHelper

  def send_sms(to,from,task_id)
    url = "http://sms.ru/sms/send?api_id=f567573b-b5aa-4444-89c3-70ca98b9abf5&to=#{to.phone1}&text="+CGI.escape('Вам поступила новая задача от '+from.fullname)
    Net::HTTP.get(URI(url))[0]
  end
end