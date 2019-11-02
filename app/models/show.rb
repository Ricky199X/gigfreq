class Show < ApplicationRecord
    belongs_to :band, optional: true
    has_many :bands, through: :band_shows
    has_many :user_shows
    has_many :users, through: :user_shows


    # Scope to order upcoming shows by date
    scope :shows_by_date, -> { order('date ASC') }

    #Scope to find all shows based on the user's favorite band
    scope :favorite_band_shows, -> (user, band) {where(user: user.favorite_band == band.name)}


    def total_users
        self.users.count
    end

    def band_name
        self.band.account.username
    end

    # def tickets(account)
    #     # look at the show, pass it a user
    #     # see if the user is in the  shows.all collection
    #     #if the user is in the show's collection
    #     if self.users.include?(user) 
    #     return user.user_shows.first.tickets_bought
    #     end
    # end
    
end
