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
                redirect_to band_path(@account.accountable_id)
            else 
                redirect_to user_path(@account.accountable_id)
            end 
        else 
            flash[:danger] = "Improper credentials given!"
            redirect_to login_path
        end
    end

    def fbauth
       if request.env['omniauth.auth']
        account = Account.from_facebook(request.env['omniauth.auth'])
        session[:account_id] = account.id
            if account.accountable_type == "User"
                redirect_to new_user_path(account)
            else
                redirect_to new_band_path(account)
            end
        else
            account = Account.find_by_email(params[:email])
            account && account.authenticate(params[:password])
            session[:account_id] = account.id
            redirect_to account_path(account)
        end
    end
    
    # make a new view + controller for the auth -> send them to another page where it asks them if they wanna
    # sign up for a user account or a band account
    # then in the sessions controller check if they're logging in as a facebook user, set the session 

    def logout
        session.delete(:account_id)
        redirect_to root_path
    end
    
    private 

    def auth
        request.env['omniauth.auth']
    end
end

    