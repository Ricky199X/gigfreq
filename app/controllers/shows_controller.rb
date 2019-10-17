class ShowsController < ApplicationController
    def index
        @shows = Show.all
    end

    def new

        if !session[:is_band]
            #flash message you're not a band
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
        @band = Band.find(params[:band_id])
        @show.band = @band

        if @show.save 
        redirect_to show_path(@show)
        else 
            render :new
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
            redirect_to edit_show_path(@show)
        else
            flash[:alert] = "Show not saved!"
        end
    end

    private

    def show_params
        params.require(:show).permit(:name, :venue, :city, :state, :date)
    end
end
