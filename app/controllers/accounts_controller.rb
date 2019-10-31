class AccountsController < ApplicationController
    # handles differentiation between a band or user account
    # sends the user to the correct form to complete sign up

    # Displays new account form
    def new
        @account = Account.new
    end

    # creates an account, determines type of user, then leads them to the correct 
    # sign up form based on whether or not they checked off the band box
    def create
        @account = Account.new(account_params)
        if @account.save
            log_in(@account)
            if params[:account][:band] == "1"
                is_band
                redirect_to new_band_path
            else
                !is_band
                redirect_to new_user_path
            end
        else
            render :new
        end
    end

    private

    def account_params
        params.require(:account).permit(:username, :email, :password, :password_confirmation, :band)
    end
    
end
