class UserShowsController < ApplicationController

  def new 
  end

  def show 
  end

  private

  def user_show_params
    params.require(:user_show).permit(:user_id, :show_id)
end

end
