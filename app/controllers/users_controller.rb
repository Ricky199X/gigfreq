class UsersController < ApplicationController
    # if the type of account being created in a user account
    # user is sent to the 2nd half of the user form here
    # user can edit profile with this controller
    
    before_action :verify_info_set, except: [:new, :create]
    before_action :require_authorized_user, except: [:new, :create]

    # display the user signup form
    def new 
        @user = User.new
    end 

    # create the user 
    def create 
        @user = User.new(user_params)
        @user.account = Account.find(session[:account_id])
        # binding.pry
        if @user.save
            redirect_to user_path(@user)
        else
            # MAKE SURE YOU RENDER ERRORS IN YOUR BAND NEW VIEW
            render :new
        end
    end

    # display the user's page - should require authorization to view their profile
    def show
        binding.pry
        # @user = User.find(params[:id])
        # require_auth(@user)
    end

    def edit
        # @user = User.find_by(id: params[:id])
        # require_authorized_user
    end

    def update
        # @user = User.find_by(id: params[:id])
        # require_authorized_user
        @user.update(user_params)

        if @user.save
            redirect_to user_path(@user)
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