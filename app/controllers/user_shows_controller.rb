class UserShowsController < ApplicationController

  def new 
    user_show = UserShow.create(user_id: params[:user_show][:user_id], show_id: params[:user_show][:show_id])
    byebug
    redirect_to user_path(user_show.user)
  end

  private

  def user_show_params
    params.require(:user_show).permit(:user_id, :show_id)
end

end
