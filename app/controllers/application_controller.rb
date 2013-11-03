# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate
  include ApplicationHelper
protected

def authenticate
  authenticate_or_request_with_http_basic do |username, password|
   @staff_login=Staff.where("login=?",username)[0]
    !@staff_login.nil? && @staff_login.password==password
  end
end

def authorize
#    logger.debug "++++"+request.parameters.inspect
#    logger.debug "++++"+self.inspect
#    request.env.each do |ee|
#      logger.debug " ------ "+ee[0]+" = "+ee[1].inspect
#    end
  if !admin?
    if request.parameters["controller"] != "tasks"
      flash[:error] = "Недостаточно прав"
      redirect_to "/"+self.class.controller_path
      false
    elsif @staff_login.position !~ /уководитель|иректор/
      flash[:error] = "Недостаточно прав"
      redirect_to "/"+self.class.controller_path
      false
    else
      true
    end
  else
    true
  end
end

end
