class Account < ApplicationRecord
    has_secure_password
    belongs_to :accountable, polymorphic: true

    validates :username, uniqueness: true
    validates :email, uniqueness: true

    
end 