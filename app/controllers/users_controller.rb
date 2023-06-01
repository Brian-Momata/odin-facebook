class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])

    # Check whether the users are following each other
    @followed = current_user.followed_users.include?(@user)
  end
end
