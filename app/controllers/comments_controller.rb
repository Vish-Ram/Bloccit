class CommentsController < ApplicationController
   respond_to :html, :js
  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.build(params.require(:comment).permit(:body))
    @comment.post = @post
    if @comment.save
       redirect_to [@post.topic, @post]
     else
       flash[:error] = @comment.errors.messages
     end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    authorize @comment
    if @comment.destroy
       flash[:notice] = "Comment was removed."
    else
       flash[:error] = "Comment couldn't be deleted. Try again."
    end
    respond_with(@comment) do |format|
      format.html {redirect_to(@post.topic, @post)}
    end
  end
end
