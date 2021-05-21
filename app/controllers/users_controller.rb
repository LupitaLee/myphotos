class UsersController < ApplicationController

    

    def new
        @user = User.new

    end

    def create
        
        @user = User.new(user_params)
        if @user.save
            flash[:message] = "Succesfully signed up"
            session[:user_id] = @user.id
            redirect_to photos_path
        else 

            render :new
        end

      


    end
    
    def index

        @users = User.all
        if params[:q] && !params[:q].empty?
            @users = @users.search(params[:q].downcase)
        end
      
    end

   

    

    def user_params
        params.require(:user).permit(:username, :email, :password, :avatar)
    end


end
