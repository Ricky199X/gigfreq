class SessionsController < ApplicationController
    # will handle login/logoout for the application

    def new

    end

    def create 
        @account = Account.find_by(email: params[:email])
        byebug
        if !@account.nil? && @account.authenticate(params[:account][:password])
                log_in(@account)
                flash[:success] = "Welcome Back, #{@account.username}!"
            if @account.accountable_type == "Band"
                redirect_to band_path
            else 
                redirect_to user_path
            end 
        else 
        # NOW handle the account being nil or not validated
            flash[:danger] = "Improper credentials given!"
            redirect_to login_path
        end
    end

    

    def logout
        session.delete(:account_id)
        redirect_to root_path
    end
    
end

    