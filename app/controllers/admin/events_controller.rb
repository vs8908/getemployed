module Admin
  class EventsController < Admin::BaseController
    before_action :set_event, only: %I[update edit]
    layout 'theme'

    def index
      @events = Event.all.order(created_at: :desc)
    end

    def new
      @event = Event.new
    end

    def create
      @event = Event.new(admin_event_attributes)
      start_date = Date.parse(params[:event][:start_date].to_s) if params[:event][:start_date].present?
      end_date = Date.parse(params[:event][:end_date].to_s) if params[:event][:end_date].present?
      @event.assign_attributes(start_date: start_date, end_date: end_date, user_id: current_user.id, public: true)
      respond_to do |format|
        if @event.save
          format.html { redirect_to admin_events_path, notice: 'Event was successfully created.' }
        else
          format.html { render :new }
        end
      end
    end

    def edit
    end

    def update
      start_date = Date.parse(params[:event][:start_date].to_s) if params[:event][:start_date].present?
      end_date = Date.parse(params[:event][:end_date].to_s) if params[:event][:end_date].present?
      @event.assign_attributes(admin_event_attributes.merge(start_date: start_date, end_date: end_date, user_id: current_user.id, public: true))
      if @event.update(admin_event_attributes)
        flash[:notice] = 'event updated successfully.'
      else
        flash[:error] = 'Failed to update event.'
      end
      respond_to do |format|
        if @event.save
          format.html { redirect_to admin_events_path, notice: 'Event was successfully created.' }
        else
          format.html { render :new }
        end
      end
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
