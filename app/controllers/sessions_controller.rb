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
        access_token = request.env["omniauth.auth"]
        account = Account.from_facebook(access_token)
        if account.save
            flash[:success] = "Welcome, #{user.accountable.username}!"
            log_in(user)
            redirect_to account_path(account)
        else
            flash[:failure] = "There was an issue with your login."
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

    