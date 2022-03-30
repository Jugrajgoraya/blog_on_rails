class PostsController < ApplicationController

    before_action :find_post, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, except: [:show, :index]
    before_action :authorize_user!, only: [:edit, :update, :destroy]

    def new
        @post = Post.new
    end
    def create
        @post = Post.new(post_params)
        @post.user = current_user
        if @post.save
            redirect_to posts_path
        else
            
            render :new
        end 
    end
    def index
        @posts = Post.all.order(created_at: :desc)
    end
    def show
        # @post is already picked with before action
        @comments = @post.comments
        @comment = Comment.new
    end
    def edit
        # @post is already picked with before action
    end
    def update
        # @post is already picked with before action
        @post.update(post_params)
        redirect_to posts_path
    end
    def destroy
        # @post is already picked with before action
        @post.destroy
        redirect_to posts_path
    end
    private

    def find_post
        @post = Post.find params[:id]
    end
    def post_params
        params.require(:post).permit(:title,:body)
    end
    def authorize_user!
        redirect_to root_path, alert: "Not Authorized! " unless can?(:crud, @post) 
      end
end
