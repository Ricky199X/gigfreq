class ShowsController < ApplicationController
    def index
        if params[:band_id]
            # binding.pry
            @band = Band.find(params[:band_id])
            @shows = @band.shows
        else
            @shows = Show.all
        end
    end

    def new
        if !session[:is_band]
            flash[:danger] = "You're not a band!"
            redirect_to user_path(current_user)
        end
        # add show errors to view
        if params[:band_id]
            @band = Band.find(params[:band_id])
        end
        @show = Show.new
    end

    def create
        #verify that band id is same as current band 
        # make sure person logged in is band
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
        @show = Show.find_by(id: params[:id])
        @show.update(show_params)

        if @show.save
            redirect_to band_show_path(@show)
        else
            flash[:alert] = "Show not saved!"
        end
    end

    private

    def show_params
        params.require(:show).permit(:name, :venue, :city, :state, :date)
    end
end
