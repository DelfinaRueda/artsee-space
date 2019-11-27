class ArtworksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @artworks = Artwork.all
  end

  def show
    find_artwork
    @comments = @artwork.comments
    @comment = Comment.new
  end

  def new
    @artwork = Artwork.new
  end

  def create
    @artwork = Artwork.new(artwork_params)
    @artwork[:user_id] = current_user.id
    @artwork[:gallery_id] = Gallery.find(current_user.id).id
    if @artwork.save
      redirect_to artist_path(@artwork.user)
    else
      render :new
    end
  end

  def destroy
    find_artwork
    @artwork.destroy
    redirect_to artist_path(current_user)
  end

  private

  def find_artwork
    @artwork = Artwork.find(params[:id])
  end

  def artwork_params
    params.require(:artwork).permit(:user_id, :gallery_id, :price, :category, :description, :photo)
  end
end
