class BandsController < ApplicationController
    before_action :verify_info_set, except: [:new, :create]
    def index
        @bands = Band.all
    end

    def new
        @band = Band.new
    end

    def create
        @band = Band.new(band_params)
        @band.account = Account.find(session[:account_id])
        if @band.save
            redirect_to band_path(@band)
        else
            # MAKE SURE YOU RENDER ERRORS IN YOUR BAND NEW VIEW
            render :new
        end
    end

    def show
        @band = Band.find(params[:id])
    end

    def edit
        @band = Band.find_by(id: params[:id])
    end

    def update
        @band = Band.find_by(id: params[:id])
        @band.update(band_params)

        if @band.save
            redirect_to edit_band_path(@band)
        else
            flash[:alert] = "Band Profile not saved"
        end
    end

    private

    def band_params
        params.require(:band).permit(:name, :email, :password, :website, :genre, :description)
    end
    
end
