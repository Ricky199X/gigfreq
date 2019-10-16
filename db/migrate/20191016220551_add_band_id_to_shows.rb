class AddBandIdToShows < ActiveRecord::Migration[6.0]
  def change
    add_column :shows, :band_id, :integer
  end
end
