class AddDetailsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :username, :string
    add_column :users, :profile_pic, :string
    add_column :users, :phone_number, :string
    add_column :users, :description, :text
    add_column :users, :facebook, :string
    add_column :users, :instagram, :string
    add_column :users, :pinterest, :string
    add_column :users, :twitter, :string
  end
end
