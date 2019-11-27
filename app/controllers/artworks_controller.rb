class ArtworksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @artworks = Artwork.all
  end

  def show
    @artwork = Artwork.find(params[:id])
    @artworks = Artwork.where("user_id = ?", @artwork.user.id)
    @comments = @artwork.comments
    @comment = Comment.new

  end
end
