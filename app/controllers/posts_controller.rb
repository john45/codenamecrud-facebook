class PostsController < ApplicationController

  def create
    @post = current_user.posts.build(post)
    if @post.save
      flash[:notice] = 'post create!'
      redirect_to '/'
    else
      flash[:alert] = 'post not create!!!'
    end
  end

  private

    def post
      params.require(:post).permit(:message)

    end

end
