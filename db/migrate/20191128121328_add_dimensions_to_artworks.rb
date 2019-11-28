class AddDimensionsToArtworks < ActiveRecord::Migration[5.2]
  def change
    add_column :artworks, :dimensions, :text
  end
end
