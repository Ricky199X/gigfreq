class Account < ApplicationRecord
    has_secure_password
    belongs_to :accountable, polymorphic: true, optional: true

    validates :username, presence: true
    validates :email, presence: true

    def self.from_facebook(auth)
        account = find_or_create_by(uid: auth['uid'], provider: auth['provider'])
        account.email = "#{auth['uid']}@#{auth['provider']}.com"
        account.password = auth['uid']
        account.username = auth['info']['name']

        if Account.exists?(account.id)
            account
        else
            account.save!
            account
        end   
    end

    def info
        self.attributes
    end
    
    def shows
        self.accountable.shows
    end

    def name
        self.accountable.username
    end
end 