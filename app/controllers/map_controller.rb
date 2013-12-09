class MapController < ApplicationController
  def index
    @workobjects = Workobject.all
    respond_to do |format|
      format.html # index.html.erb
    end
  end
   def show
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @workobject }
      end
   end
end
