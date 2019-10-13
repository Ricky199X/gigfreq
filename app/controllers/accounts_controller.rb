class AccountsController < ApplicationController

    def new
        @account = Account.new
    end

    def create
        @account = Account.create(account_params)
        if params[:is_band?] == true
            redirect_to new_band_path
        else
            redirect_to new_user_path
        end
    end


    private

    def account_params
        params.require(:account).permit(:username, :email, :password, :is_band?)
    end
    
end
