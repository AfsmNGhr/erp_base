# -*- encoding : utf-8 -*-
require 'net/http'
require 'cgi'

module Sms::SendSmsHelper

  def send_sms(to,from,task_id)
    logger.debug "$$$$ send sms to #{to.inspect} $$$$$"
    keyapi = IO.readlines(ENV["PWD"]+"/sms_key_api")[0].chomp
    url = "http://sms.ru/sms/send?api_id=#{keyapi}&to=#{to.phone1}&text="+CGI.escape('Вам поступила новая задача от '+from.fullname)
    Net::HTTP.get(URI(url))[0]
  end
end
