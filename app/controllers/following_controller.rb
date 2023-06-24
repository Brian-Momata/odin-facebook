class FollowingController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @following = @user.followed_users
  end
end
