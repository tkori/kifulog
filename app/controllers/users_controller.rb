class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :delete]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save!
    redirect_to @user, notice: "ユーザー登録が完了しました！"
  end

  def show
  end

  def edit
  end

  def update
    @user.update!(user_params)
    redirect_to @user, notice: "プロフィールが更新されました！" 
  end

  def destroy
    @user.destroy
    redirect_to root_path, notice: "ユーザー「#{@user.name}」を削除しました。"
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :description)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
