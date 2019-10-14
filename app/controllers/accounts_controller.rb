class AccountsController < ApplicationController
    # handles differentiation between a band or user account
    # sends the user to the correct form to complete sign up
    def new
        @account = Account.new
    end

    def create
        @account = Account.new(account_params)
        # binding.pry
        if @account.save
            log_in(@account)
            if params[:account][:band] == "1"
                session[:is_band] = true
                redirect_to new_band_path
            else
                session[:is_band] = false
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
