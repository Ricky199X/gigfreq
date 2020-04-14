class User < ApplicationRecord

  has_one :account, as: :accountable
  has_many :user_shows
  has_many :shows, through: :user_shows


  def name
    self.account.username
  end


  def email
    self.account.email
  end

  

  # # helper to get individual user_show.tickets?
  def user_show_tickets
    self.user_shows.tickets_bought
  end


end
