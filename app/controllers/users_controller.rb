class UsersController < ApplicationController

    def new 
        @user = User.new
    end 

    def create 
        @user = User.create(user_params)
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end

    def show
        logged_in?
        @user = User.find(params[:id])
    end

    def destroy
        session.clear
        redirect_to '/'
    end


    private

    def user_params
        # byebug
        params.require(:user).permit(:username, :email, :city, :state, :password, :password_confirmation, :favorite_band)
    end 

end