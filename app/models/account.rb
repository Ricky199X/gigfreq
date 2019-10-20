class Account < ApplicationRecord
    has_secure_password
    belongs_to :accountable, polymorphic: true, optional: true

    validates :username, uniqueness: true
    validates :email, uniqueness: true

    def self.from_facebook(auth)
        account = find_or_create_by(uid: auth['uid'], provider: auth['provider'])
        account.email = "#{auth['uid']}@#{auth['provider']}.com"
        account.password = auth['uid']
        account.username = auth['info']['name']

        if Account.exists?(account)
            account
        else
            account.save
            account
        end   
    end

    def info
        self.attributes
    end
    
end 