class AddTitleToArtworks < ActiveRecord::Migration[5.2]
  def change
    add_column :artworks, :title, :string
  end
end
