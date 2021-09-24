class UsersController < ApplicationController

    before_action :ensure_logged_in, only: [:show, :destroy]

    def index
        @users = User.all
        render :index
    end

    def new
        @user = User.new
        render :new
    end

    def show
        debugger
        @user = User.find_by(id: params[:id])
        render :show
    end

    def create
        @user = User.new(user_params)

        if @user.save
            login!(@user)
            redirect_to user_url(@user)
        else
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end    
    end

    # def edit

    # end

    # def update

    # end

    def destroy
        @user = User.find_by(id: params[:id])
        
        if @user == current_user
            @user.destroy
            loggout!
        else
            flash[:errors] = ['You cannot delete another user!']
            redirect_to users_url
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end
end