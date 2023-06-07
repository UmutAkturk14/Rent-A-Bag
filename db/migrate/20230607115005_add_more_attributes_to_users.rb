class AddMoreAttributesToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :bio, :text
    add_column :users, :phone_number, :string
    add_column :users, :city, :string
  end
end
