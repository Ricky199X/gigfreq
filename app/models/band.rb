class Band < ApplicationRecord
    
    has_one :account, as: :accountable
    has_many :shows
    has_many :user_bands
    has_many :users, through: :user_bands

    def name
        self.account.username
    end

    def fans
        users = []
        self.shows.each do |show|
            show.users.each do |user|
                users << user.name
            end
        end
        users.uniq
    end

    # helper methods for metrics 

    # total shows
    def total_shows
        self.shows.count
    end

    # total fans
    def total_fans
        total = 0
        self.shows.each do |show|
            total += show.users.count
        end
        total
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



    # def tickets_sold
    #     # has to iterate self's shows
    #     self.shows.each do |show|
    #     # then I wanna iterate thru each individual show's users
    #         show.users.each do |user|
    #     # then i wanna access the each user's user_shows tickets_bought attribute
    #             if user.user_shows.include?(self)
    #     # then i wanna take that integer, add it to a tickets variable 
    #     # then i wanna return the tickets variable
    #             end
    #         end
    #     end
    # end

    
end
