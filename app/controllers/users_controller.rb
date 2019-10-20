class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit, :update, :destroy]

  def new
    redirect_to root_path if user_signed_in?
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save!
    session[:user_id] = @user.id
    redirect_to @user, notice: "ユーザー登録が完了しました！"
  end

  def show
    @kifus = current_user.kifus.order(created_at: :desc)
  end

  def edit
    redirect_to @user if current_user != @user
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
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :description, :avatar)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
