class StaticPageController < ApplicationController
  layout false, :only => [:index]
  def index
  	@news = News.where( "status = 'enable'" ).order('date DESC').page(params[:page]).limit(5)
  	
  	@flaws = Flaw.where("status = 'enable'").order('date DESC').limit(5)
  	
  	@event = Event.where( :status => "enable" ).order( "date ASC" ).first
  	
  end
  
  def show
  
  	respond_to do | format |
  		format.html { render :template => "static_page/#{params[ :id ]}" }
  	end
  
  end
  
  def intro 	
  end
end
