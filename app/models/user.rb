class User < ApplicationRecord

  has_one :account, as: :accountable
  has_many :user_shows
  has_many :user_bands
  has_many :shows, through: :user_shows
  has_many :bands, through: :user_bands
end
