class UserPostsController < ApplicationController
    before_action :find_user
    
    def index
        @posts = @user.posts
    end
    
    def show
        @post = @user.posts.find( params[:id] )
    end
    
    def new
        @post = @user.posts.build
    end
    
    def create
        @post = @user.posts.build( post_params )
        if @post.save
            redirect_to user_posts_url( @user )
            else
            render :action => :new
        end
    end
    
    def edit
        @post = @user.posts.find( params[:id] )
    end
    
    def update
        @post = @user.posts.find( params[:id] )
        
        if @post.update( post_params )
            redirect_to user_posts_url( @user )
            else
            render :action => :edit
        end
        
    end
    
    def destroy
        @post = @user.posts.find( params[:id] )
        @post.destroy
        
        redirect_to user_posts_url( @user )
    end
    
    protected
    
    def find_user
        @user = User.find( params[:user_id] )
    end
    
    def post_params
        params.require(:post).permit(:title)
    end
end
