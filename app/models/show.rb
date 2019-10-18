class Show < ApplicationRecord
    belongs_to :band, optional: true
    has_many :bands, through: :band_shows
    has_many :user_shows
    has_many :users, through: :user_shows


end
