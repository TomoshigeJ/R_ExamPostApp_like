class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = current_user.likes.build(post: @post)
    if @like.save
      redirect_to @post, notice: 'Liked!'
    else
      redirect_to @post, alert: 'Error'
  end

  def destroy

  end
end
