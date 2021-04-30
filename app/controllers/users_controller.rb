class UsersController < ApplicationController

    

    def new
        @user = User.new

    end

    def create
        
        @user = User.new(user_params)
        if @user.save
            flash[:message] = "Succesfully signed up"
            session[:user_id] = @user.id
            redirect_to account_path
        else 

            render :new
        end


    end
    

    def show
        @user = User.find(params[:id])

    end

    def account
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end


end
