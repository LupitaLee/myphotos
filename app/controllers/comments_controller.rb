class CommentsController < ApplicationController

    before_action :find_photo, only: [:index, :show, :new, :edit, :update, :create]
    

    def create  

        @photo = Photo.find(params[:photo_id])
        @comment = @photo.comments.build(params[:comment].permit(:content, :photo_id, :user_id ))
         @comment.save 
      
        flash[:message] = "yay! you just commented"
        redirect_to photo_path(@photo)
       
    end

    def index
        
        @comments = @photo.comments
    
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
