# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_staff!
  include ApplicationHelper
protected

  def authorize
#    logger.debug "++++"+request.parameters.inspect
#    logger.debug "++++"+self.inspect
#    request.env.each do |ee|
#      logger.debug " ------ "+ee[0]+" = "+ee[1].inspect
#    end
    if !current_staff.admin?
      if request.parameters["controller"] != "tasks"
        flash[:error] = "Недостаточно прав"
        redirect_to "/"+self.class.controller_path
        false
      else
        true
      end
    end
  end
end