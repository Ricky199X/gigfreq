class AccountsController < ApplicationController

    def new
        @account = Account.new
    end

    def create
        # if checkbox is checked, account_type = band
        @account = Account.create(account_params)
        
    end


    private

    def account_params
        params.require(:account).permit(:username, :email, :password)
    end
    
end
