class Account < ApplicationRecord
    has_secure_password
    belongs_to :accountable, polymorphic: true, optional: true

    validates :username, uniqueness: true
    validates :email, uniqueness: true


    def info
        self.attributes.each {|k,v| puts v}
    end
    
end 