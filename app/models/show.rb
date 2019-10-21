class Show < ApplicationRecord
    belongs_to :band, optional: true
    has_many :bands, through: :band_shows
    has_many :user_shows
    has_many :users, through: :user_shows


    def total_users
        self.users.count
    end

    def band_name
        self.band.account.username
    end

    def tickets(user)
        # look at the show, pass it a user
        # see if the user is in the  shows.all collection
        #if the user is in the show's collection
        if self.users.include?(user) 
        return user.user_shows.first.tickets_bought
        end
    end
    
end
