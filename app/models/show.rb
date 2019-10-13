class Show < ApplicationRecord
    belongs_to :band
    has_many :user_bands
    has_many :users, through: :user_bands
end