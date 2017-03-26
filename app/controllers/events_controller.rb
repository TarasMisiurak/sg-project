class EventsController < ApplicationController

	def index
		@events = Event.order('created_at DESC')
		@upcoming_events = Event.order('created_at DESC')
	end

	def new
		@event = Event.new
	end

	def create
		@event = Event.new(event_params)
		if @event.save
			redirect_to @event
		else
			flash.now[:alert] = "Error saving event!"
			render :new
		end
	end

	def edit
		@event = Event.find(params[:id])
	end

	def update
		@event = Event.find_by_id(params[:id])
		if @event.update_attributes(event_params)
			flash.now[:notice] = "Successfully updated #{@event.title} event!"
			redirect_to event_path(@event)
		else
			flash.now[:alert] = "Error updating #{@event.title} event!"
			render :edit
		end
	end

	def show
		@event = Event.find(params[:id])
		@upcoming_events = Event.where.not(id: @event.id).order('start_time DESC').limit(3)
	end

	def destroy
		if @event.destroy
			flash.now[:notice] = "Successfully deleted event"
			redirect_to events_path
		else
			flash.now[:alert] = "Error deleting event!"
		end
	end

	private

	def event_params
		params.require(:event).permit(:title, :desc, :event_type, :start_time, :end_time)
	end

end
