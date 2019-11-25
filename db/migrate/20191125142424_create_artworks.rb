class CreateArtworks < ActiveRecord::Migration[5.2]
  def change
    create_table :artworks do |t|
      t.string :category
      t.text :description
      t.references :gallery, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
