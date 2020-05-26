class UsersController < ApplicationController
    before_action(:assign_user, only: [:show, :edit, :update, :destroy])

    # Action/Route Methods
    def index
        @users = User.all
    end

    def show
    end

    def new
        @user = User.new
    end

    def create
    end

    def edit
    end

    def update
    end

    def destroy
    end

    # Private Class Helper Methods
    private
    def assign_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:username, :phone, :address)
    end
end