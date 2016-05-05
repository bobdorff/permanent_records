class PostsController < ApplicationController
  def create
    @post = Post.new
    record = Record.find_by(catno: post_params[:catno])
    post = Post.new(user_id: current_user.id, record_id: record.id, content: post_params[:content])
    post.save
  end

  private

  def post_params
    params.require(:post).permit(:content, :catno)
  end
end
