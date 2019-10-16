class Band < ApplicationRecord

    validates :band_id, presence: true
    
    has_one :account, as: :accountable
    has_many :band_shows
    has_many :shows, through: :band_shows
    has_many :user_bands
    has_many :users, through: :user_bands
    
end
