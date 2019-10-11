class AddUserParamsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :username, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :favorite_band, :string
  end
end
