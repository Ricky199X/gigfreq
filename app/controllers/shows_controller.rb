class ShowsController < ApplicationController
    def index
        @shows = Show.all
    end

    def new
        @show = Show.new
    end

    def create
        @show = Show.create(show_params)
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
            flash[:alert] = "Show Profile not saved"
        end
    end

    private

    def show_params
        params.require(:show).permit(:name, :venue, :city, :state, :date, :band_id)
    end
end
