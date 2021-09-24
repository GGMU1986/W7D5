class SubsController < ApplicationController

    def index
    end

    def new
    end

    def create
    end

    def edit
    end

    def update
    end

    def show
    end

    private

    def sub_params
        params.require(:sub).permit(:title, :description)
    end
end