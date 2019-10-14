class SessionsController < ApplicationController
    # will handle login/logoout for the 

    def new

    end

    def create
        @account = Account.find_by(email: params[:account][:email])
        binding.pry
        if !@account.nil? && @account.authenticate(params[:account][:password])
            log_in(@account)
            redirect_to account_path(@account)
        end
    end

    def logout
        session.delete(:account_id)
        redirect_to root_path
    end
end
