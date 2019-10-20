class ShowsController < ApplicationController
    def index
        if params[:band_id]
            @shows = Band.find(params[:band_id]).shows
        elsif
            params[:user_id]
            @shows = User.find(params[:user_id]).shows
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
        current_user
        @show = Show.new(show_params)

        if current_user.accountable_type == "Band"
            @band = Band.find(params[:band_id])
            @show.band = @band
            if @show.save 
                redirect_to band_shows_path(@band)
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
        current_band
        @show = Show.find_by(id: params[:id])
        @show.update(show_params)
        if @show.save
            redirect_to band_shows_path(current_band)
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
