class FollowingController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @following = @user.follower_users
  end
end
