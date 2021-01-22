class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    comment = Comment.new(comment_params)
    if comment.save
      redirect_to post_path(@post)
    else
      flash.now[:alert] = 'コメントを入力してください。'
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
