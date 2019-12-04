class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index index_likes]

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
    @event = Event.find(params[:id])
    if @event.likes.where(user: current_user).any?
      @like = @event.likes.first
      @like.state = true
    else
      @like = Like.new(state: true)
      @like[:user_id] = current_user.id
      @like[:event_id] = params[:id]
    end
    @like.save
    respond_to do |format|
      format.js
    end
  end

  def destroy_like
    @like = Like.find(params[:id])
    @like.update(state: false)
    @event = @like.event
    @like.save
    respond_to do |format|
      format.js
    end
  end

  def index_likes
    @artist = User.find(params[:id].to_i)
    @events = @artist.events.where("state = true")
  end
end
