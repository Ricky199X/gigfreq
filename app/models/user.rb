class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_many :user_shows
  # has_many :user_bands
  # has_many :shows, through: :user_shows
  # has_many :bands, through: :user_bands
end
