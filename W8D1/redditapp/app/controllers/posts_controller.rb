class PostsController < ApplicationController
    before_action :require_author, only: [:edit, :update]
    def new 
        @subs = Sub.all
        @post = Post.new 
        render :new 
    end

    def show 
        @post = Post.find(params[:id])
        render :show 
    end

    def create 
 
        @post = current_user.posts.new(post_params)
        if @post.save
            redirect_to post_url(@post)
        else 
            flash[:errors] = @post.errors.full_messages  
            redirect_to subs_url
        end
    end

    def require_author 
        @user = Post.author.find(params[:author_id])
        @user == current_user
    end

    def edit 
        @user = current_user
        @post = Post.find(params[:id])
        render :edit
    end

    def update 
        @post = Post.find(params[:id])
        if @post.update(post_params)
            redirect_to post_url(@post)
        else 
            flash.now[:errors] = @post.errors.full_messages
            render :edit 
        end
    end

    def post_params 
        params.require(:post).permit(:title, :url, :content, sub_ids: [])
    end
end
