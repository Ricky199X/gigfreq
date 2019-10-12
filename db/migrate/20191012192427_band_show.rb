class BandShow < ActiveRecord::Migration[6.0]
  def change
    create_table :band_shows do |t|
      t.integer :band_id
      t.integer :show_id
    end
  end
end
