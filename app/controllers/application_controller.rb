class ApplicationController < ActionController::Base
    # this is so we can pass other user params aside from email and password
    

    helper_method :current_user, :logged_in

    def logged_in?
        redirect_to '/' if !current_user
    end

    # def band?
    #     redirect_to bands_path if !current_user.class == User
    # end

    private

    # def current_user
    #     @current_user ||= User.find(session[:user_id]) if session[:user_id]
    # end

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




    # def current_band
    #     @current_band ||= Band.find(session[:band_id]) if session[:band_id]
    # end

end
