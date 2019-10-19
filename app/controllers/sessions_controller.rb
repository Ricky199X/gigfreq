class SessionsController < ApplicationController
    # will handle login/logoout for the application

    def new

    end

    def create 
        @account = Account.find_by(email: params[:email])

        if !@account.nil? && @account.authenticate(params[:password])
                log_in(@account)
                flash[:success] = "Welcome Back, #{@account.username}!"
            if @account.accountable_type == "Band"
                session[:is_band] = true 
                redirect_to band_path(@account.accountable.id)
            else 
                redirect_to user_path(@account.accountable.id)
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
    
    private 

    def auth
        request.env['omniauth.auth']
    end
end

    