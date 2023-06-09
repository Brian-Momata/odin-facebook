class FollowsController < ApplicationController
  def create
    @follow = Follow.new
    @follow.follower_id = params[:follower_id]
    @follow.followed_user_id = params[:followed_user_id]

    @notif = @follow.build_notification(message: "You have a follow request")
    @notif.sender_id = params[:follower_id]
    @notif.recipient_id = params[:followed_user_id]
  
    if @follow.save
      @notif.save
      flash.now[:notice] = "You've followed this user"
    else
      flash.now[:alert] = "Can't follow this user"
    end
  end
  
  def update
    @follow = Follow.find(params[:id])
      if @follow.update(follow_params)
        flash[:success] = "Follow was successfully updated"
        redirect_to notifications_path
      else
        flash[:error] = "Something went wrong"
        redirect_to notifications_path
      end
  end
  
  def destroy
    user = User.find(params[:id])
    @follow = Follow.find_by(follower_id: current_user, followed_user_id: user)
    if @follow.destroy
      flash.now[:notice] = "You've unfollowed this user"
    else
      flash.now[:alert] = "Can't unfollow this user"
    end
  end
  
  private

  def follow_params
    params.require(:follow).permit(:status)
  end
end
