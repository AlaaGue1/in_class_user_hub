class PostsController < ApplicationController
  def index
    @posts = Post.all
  end


  def destroy
    @post = set_post
    user_id = @post.user_id
    @post.destroy
    redirect_to user_path(user_id), notice: "Post deleted successfully"
  end


  private
    def set_post
      @post = Post.find_by_id(params[:id])
    end
end
