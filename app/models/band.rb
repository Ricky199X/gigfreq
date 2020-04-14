class Band < ApplicationRecord
    
    has_one :account, as: :accountable
    has_many :shows
    has_many :user_bands
    has_many :users, through: :user_bands
    has_many :fans, -> { distinct }, through: :shows, source: :users

    def name
        self.account.username
    end


    def fan_names
        fans.pluck(:name)
    end
   
    # end

    # helper methods for metrics 

    # total shows
    def total_shows
        self.shows.count
    end

    def total_fans
        fans.count
    end

    # Location Count
    def locations
        location_count = 0
        self.shows.each do |show|
            if show.city != nil
                location_count += 1
            end
        end
        location_count
    end

    
end
