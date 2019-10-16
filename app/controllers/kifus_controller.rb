class KifusController < ApplicationController
  def index
    @kifus = Kifu.all
  end

  def new
    @kifu = Kifu.new
  end

  def create
    kifu = current_user.kifus.new(kifu_params)
    kifu.save!
    redirect_to root_path, notice: "棋譜が投稿されました！"
  end

  def show
    @kifu = Kifu.find(params[:id])
    @comments = @kifu.comments.includes(:user)
    @comment = Comment.new
  end

  def destroy
    kifu = Kifu.find(params[:id])
    kifu.kifu.purge
    kifu.destroy
    redirect_to root_path, notice: "棋譜を削除しました。"
  end

  private

  def kifu_params
    params.require(:kifu).permit(:kifu)
  end
end
