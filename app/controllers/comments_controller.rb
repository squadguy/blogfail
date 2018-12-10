class CommentsController < ApplicationController

    def create
        @post = Post.find(params[:post_id])
        #Below doesn't work.  Working Code below it.
        #@comment = @post.comments.create(params[:comment]).permit(:name, :comment)
        @comment = @post.comments.create(post_params)

        redirect_to post_path(@post)
    end

    def destroy
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        @comment.destroy
        redirect_to post_path(@post)
    end

    def post_params
        params.require(:comment).permit(:name, :comment)
    end
end
