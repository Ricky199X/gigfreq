class ApplicationController < ActionController::Base
    # this is so we can pass other user params aside from email and password
    before_action :configure_permitted_parameters, if: :devise_controller?

    def home
        
    end

    protected 

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :city, :state, :favorite_band])
    end
end
