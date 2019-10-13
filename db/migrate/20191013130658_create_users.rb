class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :city
      t.string :state
      t.string :favorite_band
    end
  end
end
