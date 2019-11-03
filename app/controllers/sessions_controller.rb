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
                is_band
                redirect_to band_path(@account.accountable_id)
            else 
                redirect_to user_path(@account.accountable_id)
            end 
        else 
            flash[:danger] = "Improper credentials given!"
            redirect_to login_path
        end
    end

     # logs out the user - displays goodbye message
     def destroy
        session.clear
        flash[:notice] = "Thank you, come again!"
        redirect_to root_path
    end

    def fbauth
        request.env['omniauth.auth']
        account = Account.from_facebook(request.env['omniauth.auth'])
        log_in(account)
        redirect_to user_path(account.accountable)
    end
    
    
    private 

    def auth
        request.env['omniauth.auth']
    end
end

    