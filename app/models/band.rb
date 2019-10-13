class Band < ApplicationRecord
    has_one :account, as: :accountable
    has_many :shows
    has_many :user_bands
    has_many :users, through: :user_bands
    
end
