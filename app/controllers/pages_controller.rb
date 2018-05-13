class PagesController < ApplicationController
  before_action :set_event, only: [:apply_test_events]
  layout 'theme', only: [:my_calender]
  def show
    render template: "pages/#{params[:page]}"
  end

  def my_calender
  end

  def apply_test_events
    if @event.present?
      if @event.users << current_user
        flash[:notice] = 'Successfully applied.'
      end
    else
      flash[:error] = 'Event doens\'t exist'
    end

    redirect_to test_events_path
  end
  
  def test_events
    @test_events = Event.public_events.includes(:users)
  end

  private


  def set_event
    @event = Event.find_by(id: params[:event_id])
  end

end 