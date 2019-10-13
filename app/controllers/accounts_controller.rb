class AccountsController < ApplicationController

    def new
        @account = Account.new
    end

    def create
        @account = Account.create(account_params)
        binding.pry
        if params[:'is_band?'] == true
            redirect_to new_band_path
        else
            redirect_to new_user_path
        end
    end


    private

    def account_params
        params.require(:account).permit(:username, :email, :password, :password_confirmation, :'is_band?')
    end
    
end
