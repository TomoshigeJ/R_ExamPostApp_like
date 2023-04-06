class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = current_user.likes.build(post: @post)
    if @like.save
      redirect_to posts_path, success: 'Liked!'
    else
      redirect_to posts_path, danger: 'Error'
    end
  end

  def destroy
    @like = current_user.likes.find_by(post_id: params[:id])
    if @like
      @like.destroy
      redirect_to posts_path, success: 'Unliked!'
    else
      redirect_to posts_path, danger: 'Error'
    end
  end
end