class UsersController < ApplicationController

    def new 
        @user = User.new
    end 

    def create 
        @user = User.create(sign_up_params)
    end

    private

    def sign_up_params
        # byebug
        params.require(:user).permit(:email :password, :password_confirmation)
    end 

    def account_update_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end 
end