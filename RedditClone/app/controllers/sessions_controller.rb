class SessionsController < ApplicationController
    before_action :ensure_logged_in, only: [:destroy]

    def new
        render :new
    end

    def create
        @user = User.find_by_credentials(params[:user][:username],params[:user][:password])
    
        if @user
           login!(@user)
           redirect_to users_url 
        else
            flash.now[:errors] = ['Invalid Credentials']
            render :new
        end
    end

    def destroy
    end
end