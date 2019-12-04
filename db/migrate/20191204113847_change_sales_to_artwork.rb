class ChangeSalesToArtwork < ActiveRecord::Migration[5.2]
  def change
    remove_column :artworks, :sales
    add_column :artworks, :sales, :integer, default: 0
  end
end
