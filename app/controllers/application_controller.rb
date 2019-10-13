class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in

    def logged_in?
        redirect_to '/' if !current_user
    end

    private

    def log_in(acct)
        session[:account_id] = acct.id
    end

    def log_out
        session.clear
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


end
