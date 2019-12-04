class AddSalesToArtwork < ActiveRecord::Migration[5.2]
  def change
    add_column :artworks, :sales, :integer
  end
end
