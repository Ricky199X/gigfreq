class UserBand < ActiveRecord::Migration[6.0]
  def change
    create_table :user_bands do |t|
      t.integer :user_id
      t.integer :band_id
    end
  end
end
