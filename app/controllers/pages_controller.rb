class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home artists]

  def home
    @users = User.all
    @artworks = Artwork.all
  end

  def artists
    @artists = User.all
  end

  def artist
    @artist = User.find(params[:id])
  end
end
