class User < ApplicationRecord

  has_one :account, as: :accountable
  has_many :user_shows
  has_many :shows, through: :user_shows
  has_many :user_bands
  has_many :bands, through: :user_bands

  accepts_nested_attributes_for :shows


  def name
    self.account.username
  end

  def email
    self.account.email
  end


end
