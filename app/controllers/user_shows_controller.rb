class UserShowsController < ApplicationController
  
  def create 
    users_only
    user_show = UserShow.create(user: current_user.accountable, show: Show.find(params[:show_id]))
    
      if user_show.save
        redirect_to user_shows_path(current_user.accountable.id)
      else 
        flash[:danger] = "Something went wrong!"
        redirect_to show_path(params[:show_id])
      end
  end


end
