class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :city
      t.string :state
      t.string :password_digest
      t.string :favorite_band
    end
  end
end
