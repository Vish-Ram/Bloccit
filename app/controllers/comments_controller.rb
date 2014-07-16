class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @topic = Topic.find(params[:topic_id])
    @comment = current_user.comments.build(params.require(:comment).permit(:body))
    @comment.post = @post
    if @comment.save
       redirect_to [@topic, @post]
     else
       flash[:error] = @comment.errors.messages
     end
  end
end
