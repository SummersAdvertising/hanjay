class EventsController < ApplicationController

	before_filter :get_events

	def index
	
	
	end
	
	def show
	
		@event = Event.find( params[ :id ] )
		
		respond_to do | format |
			format.html { render :index, :anchor => "event_" + @event.id.to_s }
		end
	
	end
	
private
	def get_events		
		@events = Event.where( "status = ? AND date < ?  ","enable", Time.now.tomorrow ).order( "date DESC" )
	end	
	
end
