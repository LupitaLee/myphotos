class PhotosController < ApplicationController

    before_action :find_photo, only: [:show, :edit, :update, :create, :destroy]



    def index
        @photos = Photo.all
       
       
    end

    def new
        @photo = Photo.new 
    end
    def show 
       
    end
    
    #question ------ why i hhave to use photo.user_id = current_user.id 
   #when curren user al ready has it and why wont redirect to photo_path and does for photos path 
    def create
       
        @photo = current_user.photos.build(photo_params)

        @photo.user_id = current_user.id
    
        if @photo.save
            redirect_to photos_path
        else
            render :new
        end
    end

    def edit 
       
    end

    def update 
       
        @photo.update(photo_params)
        if @photo.save 
            redirect_to photo_path
        else
            render :edit
        end
    end

    def destroy
     
        @photo.destroy 
        flash[:notice]= "Photo deleted"
        redirect_to photo_path 

    end


    private

    def photo_params
        params.require(:photo).permit(:title, :image)
    end

    def find_photo
        @photo = Photo.find_by(id: params[:id])
    end

 
end
end
