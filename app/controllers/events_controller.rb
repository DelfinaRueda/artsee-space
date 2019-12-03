class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]

  def index
    @events = Event.geocoded

    @markers = @events.map do |event|
      {
        lat: event.latitude,
        lng: event.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { event: event })
      }
    end
  end

  def create_like
    @like = Link.new
    @like[:user_id] = current_user.id
    @like[:event_id] = event.id
    @like.save
  end

  def show
  end
end

