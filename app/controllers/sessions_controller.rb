class SessionsController < ApplicationController
    # will handle login/logoout for the 

    def new

    end

    def create
    end

    def logout
        session.delete(:account_id)
        redirect_to root_path
    end
end
