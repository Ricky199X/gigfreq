class UserShowsController < ApplicationController

  def new 
    user_show = UserShow.create(user_id: params[:user_show][:user_id], show_id: params[:user_show][:show_id])
    redirect_to user_shows_path(user_show.user)
  end


end
