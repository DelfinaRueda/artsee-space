class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @users = User.all
    @artworks = Artwork.all
  end
end
