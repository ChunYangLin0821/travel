class PostsController < ApplicationController
    
    def index
        @posts = Post.all
    end
    
    def show
        @post = Post.find(params[:id])
    end
    
    def find_user
        @post = Post.find(params[:id])
    end
end
