class CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    comment = current_user.comments.new(comment_params)
    comment.save!
    redirect_to kifu_path(params[:kifu_id]), notice: 'コメントが投稿されました！'
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy if comment.user_id == current_user.id
    redirect_to kifu_path(params[:kifu_id]), notice: 'コメントが削除されました。'
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :kifu_id)
  end
end
