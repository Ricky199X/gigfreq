class ApplicationController < ActionController::Base
    # this is so we can pass other user params aside from email and password
    before_action :configure_permitted_parameters, if: :devise_controller?

    helper_method :current_user

    def logged_in?
        redirect_to '/' if !current_user
    end

    def band?
        redirect_to bands_path if !current_user.class == User
    end

    private

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def current_band
        @current_band ||= Band.find(session[:band_id]) if session[:band_id]
    end

    protected 

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :city, :state, :favorite_band])
    end
end
