class PhotosController < ApplicationController
    before_action :redirect_if_not_logged_in, only: [:new, :show, :edit, :update, :create, :destroy]
    before_action :find_photo, only: [:show, :edit, :update, :create, :destroy]
 

    def new
        @photo = Photo.new 
    end


    def index
       
        @photos = current_user.photos.desc_order
        if params[:q] && !params[:q].empty?
            @photos = @photos.search(params[:q].downcase)#search the collection we already have 
        end
    
    end

    
    
    

    def create
       
        
        @photo = current_user.photos.build(photo_params)
        @photo.save


        if @photo.valid?
            flash[:message] = "Photo Added Sucessfully!"
        
            redirect_to photo_path(@photo)
            
        else
            flash[:message] = "There was an Error please try again "
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
