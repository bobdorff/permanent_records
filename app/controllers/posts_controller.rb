class PostsController < ApplicationController
  def create
    @post = Post.new
    record = Record.find_by(catno: post_params[:catno])
    Post.new(user_id: current_user.id, record_id: record.id, content: params[:content]
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
