class SessionsController < ApplicationController

    def new

    end
    def create
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
            flash[:message]= "succesful sign in"
            session[:user_id] = @user.id
            redirect_to root_path
        else
            render :new
        end
    end

    def logout
        session.clear
        redirect_to login_path
    end


end
