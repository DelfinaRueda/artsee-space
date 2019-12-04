class AddViewsToArtwork < ActiveRecord::Migration[5.2]
  def change
    add_column :artworks, :views, :integer, default: 0
  end
end
