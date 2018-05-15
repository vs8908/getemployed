module Admin
  class EventsController < Admin::BaseController
    before_action :set_event, only: %I[update edit]
    layout 'theme'

    def index
      @events = Event.all
    end

    def new
      @event = Event.new
    end

    def create
      byebug
      @event = Event.new(admin_event_attributes)
    end

    def edit
    end

    def update
      if @event.update(admin_event_attributes)
        flash[:notice] = 'event updated successfully.'
      else
        flash[:error] = 'Failed to update event.'
      end
      redirect_to admin_events_path
    end

    private

    def set_event
      @event = Event.find_by(id: params[:id])
    end

    def admin_event_attributes
      params.require(:event).permit(:title, :location)
    end
  end
end
