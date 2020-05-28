class SessionsController < ApplicationController

    # Action/Route Methods
    def new
    end

    def create
        # Look up user in database
        @user = User.find_by_username(params[:username])
        if !!@user
            # User found, check the password
            if @user.authenticate(params[:password])
                # Password correct, login user by adding :user_id to session
                session[:user_id] = @user.id
                redirect_to(user_path(@user))
            else
                # Password incorrect, return error
                flash[:error] = "Password incorrect"
                redirect_to(login_path)
            end    
        else
            # User not found, return error
            flash[:error] = "Username not found"
            redirect_to(login_path)
        end

    end

    def destroy
        session.delete(:user_id)
        redirect_to(root_path)
    end

end