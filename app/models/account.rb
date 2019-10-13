class Account < ApplicationRecord
    belongs_to :accountable, polymorphic: true
    
    validates :username, uniqueness: true
    validates :email, uniqueness: true

    
end 