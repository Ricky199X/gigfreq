class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :current_user, :logged_in

    

    private

    def log_in(acct)
        session[:account_id] = acct.id
    end

    def logged_in
        !!session[:account_id]
    end

    def current_user
        Account.find_by(id: session[:account_id])
    end

    def current_band
        current_user.accountable.id
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

    def users_only
        redirect_to band_path(current_user.accountable) if is_band?
    end

    def is_band
        return current_user.accountable_type == "Band"
    end

    def require_auth(user)
        if !current_user
            flash[:error] = "You can't do that!"
            redirect_to users_path
        end
    end

end
