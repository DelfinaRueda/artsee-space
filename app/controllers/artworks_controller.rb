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

    @activate_controls = @artworks.count > 1
    if @activate_controls
      previous_aw = @artworks.where('id < ?', params[:id]).last
      next_aw = @artworks.where('id > ?', params[:id]).first
      previous_aw = @artworks.last if previous_aw.nil?
      next_aw = @artworks.first if next_aw.nil?
      @prev_aw_path = polymorphic_path(previous_aw)
      @next_aw_path = polymorphic_path(next_aw)
    end

    if user_signed_in?
      make_read if current_user.id == @artwork.user_id
      if current_user.id != @artwork.user.id
        @artwork[:views] += 1
        @artwork.save
      end
    end
  end

  def next
    self.class.where("id > ?", id).first
 end

  def previous
    self.class.where("id < ?", id).last
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
