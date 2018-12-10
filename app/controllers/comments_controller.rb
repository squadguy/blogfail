class CommentsController < ApplicationController

    def create
        @post = Post.find(params[:post_id])
        #Below doesn't work.  Working Code below it.
        #@comment = @post.comments.create(params[:comment]).permit(:name, :comment)
        @comment = @post.comments.create(post_params)

        redirect_to post_path(@post)
    end

    def destroy
    end

    def post_params
        params.require(:comment).permit(:name, :comment)
    end
end
