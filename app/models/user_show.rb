class UserShow < ApplicationRecord
    belongs_to :user
    belongs_to :show

    def tickets
        self.tickets_bought
    end
    
end