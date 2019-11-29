class AddPriceToArtworks < ActiveRecord::Migration[5.2]
  def change
    add_monetize :artworks, :price, currency: { present: false }
  end
end
