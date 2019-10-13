class UsersController < ApplicationController
    before_action :verify_info_set, except: [:new, :create]

    def new 
        @user = User.new
    end 

    def create 
        @user = User.new(user_params)
        @user.account = Account.find(session[:account_id])
        if @user.save
            redirect_to user_path(@user)
        else
            # MAKE SURE YOU RENDER ERRORS IN YOUR BAND NEW VIEW
            render :new
        end
    end

    def show
        logged_in?
        @user = User.find(params[:id])
    end

    def edit
        @user = User.find_by(id: params[:id])
    end

    def update
        @user = User.find_by(id: params[:id])
        @user.update(user_params)

        if @user.save
            redirect_to edit_user_path(@user)
        else
            flash[:alert] = "User Profile not saved"
        end
    end

    def destroy
        session.clear
        redirect_to '/'
    end


    private

    def user_params
        params.require(:user).permit(:city, :state, :favorite_band)
    end 

end