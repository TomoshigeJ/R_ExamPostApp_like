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
    @like = current_user.likes.find_by(post_id: params[:post_id])
    if @like
      @like.destroy
      redirect_to @like.post, notice: 'Unliked!'
    else
      redirect_to root_url, alert: 'Error'
    end
  end
end