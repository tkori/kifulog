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

  private

  def kifu_params
    params.require(:kifu).permit(:kifu)
  end
end
