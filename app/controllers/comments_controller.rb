class CommentsController < ApplicationController

    before_action :set_comment, only: [:show, :edit, :update, :create, :destroy]

    def index
        @comments = Comment.all
    end

    def new
        @comment = Comment.new 
    end
    def show 
       
    end
    
    def create
        @comment.new(comment_params)
        if @comment.save
            redirect_to comment_path
        else
            render :new
        end
    end

    def edit 
       
    end

    def update 
       
        @comment.update(comment_params)
        if @comment.save 
            redirect_to comment_path
        else
            render :edit
        end
    end

    def destroy
     
        @comment.destroy 
        flash[:notice]= "Photo deleted"
        redirect_to comment_path 

    end


    private

    def comment_params
        params.require(:comment).permit(:content)
    end

    def set_comment
        @comment = Comment.find(params[:id])
    end
end
