class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home artists artist]

  def home
    @users = User.all
    @artworks = Artwork.all
  end

  def artists
    if params[:query].present?
      @artists = User.global_search(params[:query])
    else
      @artists = User.all
    end
  end

  def artist
    @artist = User.find(params[:id])
    @artworks = Artwork.where(user_id: params[:id])
  end
end
