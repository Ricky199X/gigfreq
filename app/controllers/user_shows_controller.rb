class UserShowsController < ApplicationController

  # def index
  #   current_user
  #   if current_user.accountable_type == "User"
  #       # find the current_user logged in 
  #     @user = User.find(params[:user_id])
  #       # @shows becomes any shows that the user has associated with their instance
  #     @shows = @user.shows
  #   else
  #     flash[:danger] = "You are not a user!"
  #       redirect_to root_path
  #   end
  # end

  def new 
   
  end

  def show 
  end

  private

  def user_show_params
    params.require(:user_show).permit(:user_id, :show_id)
end

end
