class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.build(post_id: @post.id, user_id: current_user.id )

    if @like.save
      flash[:notice] = "You've liked the post"
    else
      flash.now[:alert] = "There was an error while liking the post"
    end
    redirect_to @post
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    flash[:notice] = "You've unliked the post"
    redirect_to @like.post
  end  
end
