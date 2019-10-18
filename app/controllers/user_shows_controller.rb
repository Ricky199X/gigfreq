class UserShowsController < ApplicationController

    def index
    end

    def create
        # find the show we want user to attend
        # find the user we want to attend it
        # 
    end


    private

    def user_show_params
        params.require(:user_show).permit(:user_id, :show_id)
    end
end
