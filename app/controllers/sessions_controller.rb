class SessionsController < ApplicationController
    # will handle login/logoout for the 

    def new

    end

    def create
        @account = Account.find_by(email: params[:email])
        binding.pry
        if !@account.nil? && @account.authenticate(params[:account][:password])
            log_in(@account)
            # if accountable_type == "Band", redirect to band path
            if @account.accountable_type == "Band"
                redirect_to band_path
            # else, redirect to user_path
            else 
                redirect_to user_path
            end
        end
    end

    def logout
        session.delete(:account_id)
        redirect_to root_path
    end
end
