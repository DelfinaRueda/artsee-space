class ArtworksController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show index]

  def show
    @artwork = Artwork.find(params[:id])
  end
end
