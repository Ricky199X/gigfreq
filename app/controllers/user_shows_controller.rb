class UserShowsController < ApplicationController

    def index
    end

    def create
        @show = Show.find(params[:show_id])
        @user = User.find(params[:user_id])
        @show.users << @user
        byebug
    end


    private

    def user_show_params
        params.require(:user_show).permit(:user_id, :show_id)
    end
end
