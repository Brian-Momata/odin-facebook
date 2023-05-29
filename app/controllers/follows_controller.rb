class FollowsController < ApplicationController
  def create
    @follows = Follow.new(follows_params)
    if @follows.save
      flash[:notice] = "You've followed this user"
    else
      flash[:alert] = "Can't follow user"
    end
  end

  def destroy
  end

  private

  def follows_params
    params.require(:follow).permit(:follower_id, :followed_user_id)
  end
end
