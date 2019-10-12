class RegistrationsController < Devise::RegistrationsController


    def new 
        @user = User.new
    end 

    def create 
        @user = User.create(user_params)
    end

    private

    def sign_up_params
        params.require(:user).permit(:username, :email, :city, :state, :favorite_band, :password, :password_confirmation)
    end 

    def account_update_params
        params.require(:user).permit(:username, :email, :city, :state, :favorite_band, :password, :password_confirmation)
    end 
end