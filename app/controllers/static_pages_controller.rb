class StaticPagesController < ApplicationController
  before_action :authenticate_user!
  def home
    @post = Post.new
    @posts = current_user.posts.order('created_at DESC')

  end
end
