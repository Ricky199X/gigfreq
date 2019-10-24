class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :current_user, :logged_in

    

    private

    # prevents an user not currently logged in from seeing any content
    def authenticate
        redirect_to login_path if !logged_in
    end

    #logs in the account
    def log_in(acct)
        session[:account_id] = acct.id
    end

    # determines if the an acocunt is logged in
    def logged_in
        !!current_user
    end

    # Determines who the current user is by searching for the account_id currently in the sessions hash
    def current_user
        current_user = Account.find_by(id: session[:account_id])
    end

    # determines if the current_user is both logged in and validates if they are a band
    def current_band
        current_user.logged_in && current_user.accountable_type == "Band"
    end

    def log_out
        session.delete(:account_id)
        render '/'
    end

    def verify_info_set
        acct = Account.find(session[:account_id])

        if acct.accountable.nil?
            if session[:is_band]
                redirect_to new_band_path
            else
                redirect_to new_user_path
            end
        end
    end

    # helper for nav bar based on logged in/logged out

    def navbar
        if logged_in?
            render 'layouts/logged_in_navbar'
        else
            render 'layouts/logged_out_navbar'
        end
    end

    # prevents band profiles from accessing user resources
    def users_only
        redirect_to band_path(current_user.accountable) if is_band
    end

    # expression that current_user's accountable_type == Band
    def is_band
        return current_user.accountable_type == "Band"
    end

    # check authorization for a user before they can do anything - # should evaluate to true
    def require_auth(user)
       return head(:forbidden) unless current_user.id == user.account.id
    end

    def require_authorized_user
        @user = User.find(params[:id])
        require_auth(@user)
    end

    def require_authorized_band
        @band = Band.find(params[:id])
        require_auth(@band)
        is_band
    end

end
