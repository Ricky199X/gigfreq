class SessionsController < ApplicationController

    def new
     end
  
     def create
        @user = User.find_by(name: params[:user][:name])
  
        if !@user.nil? && @user.authenticate(params[:user][:password])
           session[:user_id] = @user.id
           redirect_to user_path(@user)
        end
    end
  
    def destroy
     session.clear
     redirect_to root_path
    end
end
