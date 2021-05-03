class CommentsController < ApplicationController

    before_action :find_photo, only: [:show, :new, :edit, :update, :create, :destroy]
    

    def create  
    
        @photo = Photo.find(params[:photo_id])
        # @photo = Photo.find_by(id: params[:id])
        @comment = @photo.comments.build(params[:comment].permit(:content, :photo_id, :user_id))
        @photo.comments << @comment
        redirect_to photo_path(@photo)
       
    end

    def index
        if @photo
     
        @comments = @photo.comments
        else   

        @comments = current_user.comments
        end

    end

    def show 

    end
    def new
        @comment = Comment.new
    end

    
   
    def destroy
       
        @comment = @photo.comments.find(params[:id])
        @comment.destroy 
        flash[:notice]= "Photo deleted"
        redirect_to photo_path(@photo)

    end


    private



    def find_photo
        @photo = Photo.find(params[:photo_id])
    end
end
