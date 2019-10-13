class SessionsController < ApplicationController

    def login

    end

    def create
        if @user = User.find_by(email: params[:user][:email])
            if @user.authenticate(params[:user][:password])
                log_in(@user)
                flash[:success] = "Welcome back, #{@user.name}"
                redirect_to dashboard_path
            else
                flash[:danger] = "Improper login information entered."
                redirect_to login_path
            end
        else
            flash[:danger] = "Improper login information entered."
            redirect_to login_path
        end
    end
end
