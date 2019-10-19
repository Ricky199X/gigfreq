class ShowsController < ApplicationController
    def index
        # checks if the current user accountable type = band 
        if current_user.accountable_type == "Band"
            # binding.pry
            # if the validation = true, look for the specific band 
            @band = Band.find(params[:band_id])
            # if we find thee band, the shows == their shows
            @shows = @band.shows
        elsif current_user.accountable_type == "User"
            # find the current_user logged in 
            @user = User.find(params[:user_id])
            # @shows becomes any shows that the user has associated with their instance
            @shows = @user.shows
            redirect_to user_shows_path(@user)
        else
            @shows = Show.all
        end
    end

    def new
        if !session[:is_band]
            flash[:danger] = "You're not a band!"
            redirect_to user_path(current_user)
        end
        if params[:band_id]
            @band = Band.find(params[:band_id])
        end
        @show = Show.new
    end

    def create
        #verify that band id is same as current band 
        # make sure person logged in is band
        current_user
        @show = Show.new(show_params)

        if current_user.accountable_type == "Band"
            @band = Band.find(params[:band_id])
            @show.band = @band
            if @show.save 
                redirect_to band_shows_path(current_user)
            else 
                render :new
            end
        end
    end

    def show
        @show = Show.find(params[:id])
    end

    def edit
        @show = Show.find_by(id: params[:id])
    end

    def update
        current_user
        @show = Show.find_by(id: params[:id])
        @show.update(show_params)

        if @show.save
            redirect_to band_shows_path(current_user)
        else
            flash[:alert] = "Show not saved!"
            redirect to edit_path(@show)
        end
    end

    private

    def show_params
        params.require(:show).permit(:name, :venue, :city, :state, :date)
    end
end
