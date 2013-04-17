class StaticPageController < ApplicationController
  layout false, :only => [:index]
  def index
  	@news = News.order('created_at DESC').page(params[:page])
  	
  	@event = Event.where( :status => "enable" ).order( "date DESC" ).first
  	
  end
  
  def show
  
  	respond_to do | format |
  		format.html { render :template => "static_page/#{params[ :id ]}" }
  	end
  
  end
  
  def intro 	
  end
end
