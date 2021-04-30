class PhotosController < ApplicationController
    before_action :redirect_if_not_logged_in, only: [:new, :show, :edit, :update, :create, :destroy]
    before_action :find_photo, only: [:show, :edit, :update, :create, :destroy]
    # validates :title, presence: true



    def index
      
        @photos = current_user.photos
       
       
    end

    def new
        @photo = Photo.new 
    end
    
    
    #question ------ why i hhave to use photo.user_id = current_user.id 
   #when curren user al ready has it and why wont redirect to photo_path and does for photos path 
    def create
       
        
        @photo = current_user.photos.build(photo_params)
        if @photo.save
        
            redirect_to photo_path(@photo)
            
        else
           
            render :new
        end
    end
    def show 
       
    end
    def edit 
       
    end



    def update 
       
        @photo.update(photo_params)
        if @photo.save 
            redirect_to photo_path(@photo)
        else
            render :edit
        end
    end

    

    def destroy
     
        @photo.destroy 
        flash[:notice]= "Photo deleted"
        redirect_to photos_path 

    end


    private

    def photo_params
        params.require(:photo).permit(:title, :image)
    end

    def find_photo
        @photo = Photo.find_by(id: params[:id])
    end

 

end
