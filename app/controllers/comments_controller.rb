class CommentsController < ApplicationController
  before_action :require_sign_in
  before_action :authorize_user, only: [:destroy]

  def create
    if params[:post_id]
      @post = Post.find params[:post_id]
      @comment = @post.comments.build(comment_params)
      @comment.user = current_user
      @comment.save
      redirect_to [@post.topic, @post]
    elsif params[:topic_id]
      @topic = Topic.find params[:topic_id]
      @comment = @topic.comments.build(comment_params)
      @comment.user = current_user
      @comment.save
      redirect_to @topic
    end
  end

  def destroy
    @parent  = params[:post_id] || params[:topic_id]
    @comment = @parent.comments.new comment_params

    if comment.destroy
      flash[:notice] = 'Comment was deleted successfully.'
      redirect_to [@post.topic, @post]
    else
      flash[:alert] = "Comment couldn't be deleted. Try again."
      redirect_to [@post.topic, @post]
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def authorize_user
    comment = Comment.find(params[:id])
    unless current_user == comment.user || current_user.admin?
      flash[:alert] = 'You do not have permission to delete a comment.'
      redirect_to [comment.post.topic, comment.post]
    end
  end
end
