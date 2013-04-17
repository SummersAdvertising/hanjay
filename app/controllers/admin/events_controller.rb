# encoding: utf-8
class Admin::EventsController < ApplicationController

	layout "admin"

	def index
		
		where_clause = ''
		
		case params[ :status ]
			when "disable"
				where_clause = "status <> 'enable' AND date < '#{Time.now.tomorrow.at_beginning_of_day.to_s}'"
			when "expired"
				where_clause = "date > '#{Time.now.tomorrow.at_beginning_of_day.to_s}'"
			else
				where_clause = "status = 'enable' AND date < '#{Time.now.tomorrow.at_beginning_of_day.to_s}'"
				
		end
		
		@events = Event.where(where_clause).order( "date DESC" )
	
	end
	
	def show
	
		@event = Event.find( params[ :id ] )
	
	end
	
	def edit
	
		@event = Event.find( params[ :id ] )
	
	end
	
	def new
		@event = Event.new
		
	
	end
	
	def create
		@event = Event.new( params[ :event ] )
		
		
		respond_to do | format |
			if @event.save
				format.html { redirect_to admin_events_path }
			else
				format.html { render :new }
			end 
		end
		
	
	end
	
	def update
	
		@event = Event.find( params[ :id ] )
		
		respond_to do | format |
			if @event.update_attributes( params[ :event ] )
				flash[ :notice ] =  "課程更新完成"
				format.html { render action: "show" }
			else
				format.html { render action: "new" }
			end
		end
	
	end
	
	def destroy
		@event = Event.find(params[:id])
		
		@event.destroy
		
		respond_to do | format |
			format.html { redirect_to admin_events_path }
		end
	
	end

end
