class ShowsController < ApplicationController
    
    def index
        if params[:band_id]
            @band = Band.find(params[:band_id])
            require_authorized_band(@band)
            @shows = Band.find(params[:band_id]).shows
        elsif
            params[:user_id]
            @user = User.find(params[:user_id])
            require_authorized_user(@user)
            @shows = User.find(params[:user_id]).shows
        else
            @shows = Show.all
        end
    end

    def new
        # binding.pry
        if !is_band
            flash[:danger] = "You're not a band!"
            redirect_to user_path(current_user)
        end
        if is_band
            @band = Band.find(params[:band_id])
            require_auth(@band)
        end
        @show = Show.new
    end

    def create
        # require_authorized_band
        @show = Show.new(show_params)

        if current_user.accountable_type == "Band"
            @band = Band.find(params[:band_id])
            require_auth(@band)
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
        @band = Band.find(params[:band_id])
        require_authorized_band(@band)
        @show = Show.find_by(id: params[:id])
        # require_authorized_band(@band)
    end

    def update
        # require_authorized_band
        @show = Show.find_by(id: params[:id])
        @show.update(show_params)
        if @show.save
            redirect_to band_shows_path(@show.band)
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
