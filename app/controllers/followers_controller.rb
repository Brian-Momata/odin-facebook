class FollowersController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @followers = @user.followed_users
  end
end
