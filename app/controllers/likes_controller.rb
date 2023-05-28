class LikesController < ApplicationController
  before_action :set_like, only: [:destroy]

  # POST /posts/:id/likes
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

  # DELETE /posts/:id/likes/1 or /likes/1.json
  def destroy
    
  end

  private
    
    def set_like
      @like = Like.find(params[:id])
    end
end
