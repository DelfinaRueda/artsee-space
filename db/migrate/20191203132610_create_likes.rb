class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.references :user
      t.references :event
      t.boolean :state, default: false

      t.timestamps
    end
  end
end
