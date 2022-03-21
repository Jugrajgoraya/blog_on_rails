class CommentsController < ApplicationController

    before_action :find_post
    def create
        @comment = Comment.new params.require(:comment).permit(:body)
        @comment.post = @post
        if @comment.save
            redirect_to post_path(@post)
        end
    end

    def destroy
        @comment = Comment.find params[:id]
        if @comment.destroy
            redirect_to post_path(@post)
        end
    end
    private

    def find_post
        @post  = Post.find params[:post_id]
    end
end
