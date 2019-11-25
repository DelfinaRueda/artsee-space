class AddArtworkPicToArtwork < ActiveRecord::Migration[5.2]
  def change
    add_column :artworks, :artwork_pic, :string
  end
end
