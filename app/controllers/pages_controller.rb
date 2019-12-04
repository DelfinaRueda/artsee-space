class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home artists artist_home artist_about artist_events]

  def home
    @users = User.all
    @artworks = Artwork.all
    @popartworks = @artworks.sort_by{ |artwork| -artwork[:sales] }
  end

  def artists
    if params[:query].present?
      @artists = User.global_search(params[:query])
    else
      @artists = User.all
    end
  end

  def artist_home
    @artist = User.find(params[:id])
    @artworks = Artwork.where(user_id: params[:id])
  end

  def artist_about
    @artist = User.find(params[:id])
    @artworks = Artwork.where(user_id: params[:id])
  end

  def artist_events
    @artist = User.find(params[:id])
    @artworks = Artwork.where(user_id: params[:id])
  end
end
