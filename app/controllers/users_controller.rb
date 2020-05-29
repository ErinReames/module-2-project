class UsersController < ApplicationController
    # Action/Route Filters
    before_action(:assign_user, only: [:show, :edit, :update, :destroy])
    before_action(:require_login, except: [:index, :new, :create])

    # Action/Route Methods
    def index
        @users = User.all_username_ordered
    end

    def show
    end

    def new
        !!params[:user] ? @user = User.new(user_params) : @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
            # Login User the redirect to their show page
            session[:user_id] = @user.id
            redirect_to(user_path(@user))
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to(new_user_path(user: user_params))
        end
    end

    def edit
    end

    def update
        @user.update(user_params)
        if @user.valid?
            redirect_to(user_path(@user))
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to(edit_user_path(@user))
        end
    end

    def destroy
        @user.destroy
        redirect_to(users_path)
    end

    # Private Class Instance Helper Methods
    private
    def assign_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:username, :phone, :address, :password, :password_confirmation)
    end

    def require_login
        if current_user
            if current_user.username == "Admin"
                # Admin is logged in
            else
                # Only allow users to look at their pages
                return head(:forbidden) unless current_user.id == @user.id
            end
        else
            # No user is logged in
            head(:forbidden)
        end
    end
    
end