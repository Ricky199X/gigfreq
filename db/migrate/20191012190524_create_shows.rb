class CreateShows < ActiveRecord::Migration[6.0]
  def change
    create_table :shows do |t|
      t.string :name
      t.string :venue
      t.string :city
      t.string :state
      t.date :date
      t.timestamps
    end
  end
end
