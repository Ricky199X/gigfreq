class Band < ApplicationRecord
    has_secure_password

    has_many :shows
    has_many :user_bands
    has_many :users, through: :user_bands
    
end