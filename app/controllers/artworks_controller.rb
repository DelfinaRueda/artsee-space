class ArtworksController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    if params[:query].present? && params[:category].present?
      @artworks = Artwork.global_search(params[:query])
      @artworks = @artworks.where(category: params[:category])
    elsif params[:query].present? && params[:category].blank?
      @artworks = Artwork.global_search(params[:query])
    elsif params[:query].blank? && params[:category].present?
      @artworks = Artwork.where(category: params[:category])
    else
      @artworks = Artwork.all
    end
  end

  def show
    find_artwork
    @artworks = Artwork.where("user_id = ?", @artwork.user.id)
    @orders = Order.all
    @comments = @artwork.comments
    @comment = Comment.new
    if current_user.present?
      make_read if current_user.id == @artwork.user_id
    end
    if current_user != nil && current_user.id != @artwork.user.id
      @artwork[:views] += 1
      @artwork.save
    end
  end

  def new
    @artwork = Artwork.new
  end

  def create
    @artwork = Artwork.new(artwork_params)
    @artwork[:user_id] = current_user.id
    @artwork[:gallery_id] = Gallery.find(current_user.galleries.first.id).id
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

  def make_read
    @comments.each do |comment|
      comment.read = true
      comment.save
    end
  end

  def find_artwork
    @artwork = Artwork.find(params[:id])
  end

  def artwork_params
    params.require(:artwork).permit(:user_id, :gallery_id, :price_cents, :category, :description, :photo, :title)
  end
end
