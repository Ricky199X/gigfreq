class UsersController < ApplicationController

    def new 
        @user = User.new
    end 

    def create 
        @user = User.create(user_params)
    end


    private

    def user_params
        # byebug
        params.require(:user).permit(:username, :email, :city, :state, :password, :password_confirmation, :favorite_band)
    end 

end