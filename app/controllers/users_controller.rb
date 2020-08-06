class UsersController < ApplicationController
    before_action :authenticate_user!

    def index
    end

    def new
    end

    def edit
    end

    def show
        @user = User.find(params[:id])
    end

    def update
    end

    def destroy
    end

    def create
    end

  
end
  
