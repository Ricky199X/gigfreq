class ApplicationController < ActionController::Base

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

end
