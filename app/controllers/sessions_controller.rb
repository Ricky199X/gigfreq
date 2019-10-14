class SessionsController < ApplicationController

    def login

    end

    def create
        if @user = User.account.find_by(email: params[:email])
            binding.pry
            if @user.account.authenticate(params[:user][:password])
                log_in(@user)
                flash[:success] = "Welcome back, #{@user.account.username}"
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

    def logout
        session.delete(:account_id)
        redirect_to root_path
    end
end
