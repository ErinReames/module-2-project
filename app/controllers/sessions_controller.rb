class SessionsController < ApplicationController
    # Action/Route Filters
    before_action(:assign_user, only: :create)

    # Action/Route Methods
    def new
    end

    def create
      return head(:forbidden) unless @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to(user_path(@user))
    end

    def destroy
        session.delete(:username)
    end

    # Private Class Instance Helper Methods
    private
    def assign_user
        @user = User.find_by_username(params[:username])
    end

end