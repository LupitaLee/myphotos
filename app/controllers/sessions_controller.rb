class SessionsController < ApplicationController

    def new

    end
    def create
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
            flash[:message]= "succesful sign in"
            session[:user_id] = @user.id
            redirect_to photos_path
        else
            render :new
        end
    end

    def logout
        session.clear
        redirect_to root_path
    end

    def omniauth
        @user = User.find_or_create_by(username: auth[:info][:email]) do |u|
            u.email = auth[:info][:email]
            u.username = auth[:info][:email]
            u.username = auth[:info][:name]
            u.uid = auth[:uid]
            u.provider = auth[:provider]
            u.password = SecureRandom.hex(10)
        end
        
        if @user.valid?
            session[:user_id] = @user.id
            redirect_to photos_path
        else
            flash[:message] = "Credential error"
            redirect_to login_path
        end
    end

    private
    def auth
        request.env['omniauth.auth']
    end


end
