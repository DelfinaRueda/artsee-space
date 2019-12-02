class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :date
      t.text :description
      t.string :category
      t.integer :fee
      t.string :location

      t.timestamps
    end
  end
end
