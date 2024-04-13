class AddInfoToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :role, :integer
    add_column :users, :fisrt_name, :string
    add_column :users, :last_name, :string
    add_column :users, :phone_number, :string
    add_column :users, :address, :string
    add_column :users, :city, :string
    add_column :users, :zip, :string
  end
end
