class UsersController < ApplicationController

  def index
    @users = User.all
    @date1 = Date.current.strftime('%Y年 %m月 %d日')
    @count = User.count
  end

  def new
    @user = User.new
    @date1 = Date.current.strftime('%Y年 %m月 %d日')
  end

  def create
    @user = User.new(params.require(:user).permit(:title, :start_date, :end_date, :all_day, :schedule_memo))
    if @user.save
      flash[:notice] = "スケジュールを新規登録しました"
      redirect_to :users
    else
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
    @date1 = Date.current.strftime('%Y年 %m月 %d日')
  end

  def edit
    @user = User.find(params[:id])
    @date1 = Date.current.strftime('%Y年 %m月 %d日')
  end

  def update
    @user = User.find(params[:id])
    if @user.update(params.require(:user).permit(:title, :start_date, :end_date, :all_day, :schedule_memo))
      flash[:notice] = "ユーザーIDが「#{@user.id}」のスケジュールを更新しました"
      redirect_to :users
    else
      render "edit"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "スケジュールを削除しました"
    redirect_to :users
  end

end
