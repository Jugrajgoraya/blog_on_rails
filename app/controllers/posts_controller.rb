class PostsController < ApplicationController

    before_action :find_post, only: [:show, :edit, :update, :destroy]

    def new
        @post = Post.new
    end
    def create
        @post = Post.new(post_params)
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
end
