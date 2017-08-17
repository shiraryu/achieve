class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @users = User.find(@user.followers.ids, @user.followed_users.ids)
  end
end
