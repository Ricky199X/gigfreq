class Band < ApplicationRecord
    
    has_one :account, as: :accountable
    has_many :band_shows
    has_many :shows, through: :band_shows
    has_many :user_bands
    has_many :users, through: :user_bands

    def name
        self.account.username
    end

    def shows
        # needs to find all shows where band_id == self.id
        Show.select {|gig| gig.band_id == self.id}
    end


    
end
