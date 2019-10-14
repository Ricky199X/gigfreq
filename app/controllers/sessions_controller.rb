class SessionsController < ApplicationController
    # will handle login/logoout for the 

    def new

    end

    # def create
    #     @account = Account.find_by(email: params[:email])
    #     if @account = nil
    #         render :new
    #     # binding.pry
    #     else !@account.nil? && @account.authenticate(params[:account][:password])
    #         log_in(@account)
    #         # if accountable_type == "Band", redirect to band path
    #         if @account.accountable_type == "Band"
    #             redirect_to band_path
    #         # else, redirect to user_path
    #         else 
    #             redirect_to user_path
    #         end 
    #     end
    # end

    def logout
        session.delete(:account_id)
        redirect_to root_path
    end
end

    def create 
        if !@account.nil? && @account.authenticate(params[:account][:password])
            @account = Account.find_by(email: params[:email])
                log_in(@account)
            if @account.accountable_type == "Band"
                redirect_to band_path
            else 
                redirect_to user_path
            end 
        else 
        # NOW handle the account being nil or not validated
            render :new
        end
    end