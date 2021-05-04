class CommentsController < ApplicationController

    before_action :find_photo, only: [:show, :new, :edit, :update, :create]
    

    def create  
    
        @photo = Photo.find(params[:photo_id])
        @comment = @photo.comments.build(params[:comment].permit(:content, :photo_id, :user_id))
        @photo.comments << @comment
        redirect_to photo_path(@photo)
       
    end

    def index
        if @photo
     
        @comments = @photo.comments
        else   

        @comments = current_user.comments
          #order the comments 
        end

    end

    def show 

    end
    def new
        @comment = Comment.new
    end

    
   
  

    private



    def find_photo
       
        @photo = Photo.find(params[:photo_id])
    end
end
