class FollowersController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @followers = @user.follower_users
  end
end
