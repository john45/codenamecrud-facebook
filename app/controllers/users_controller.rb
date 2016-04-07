class UsersController < ApplicationController
  before_action :authenticate_user!

  def sign_out
    current_user.user_session.destroy
    redirect_to root
  end

  def show
    @user = User.find_by(id: params[:id])
    @posts = @user.posts.order('created_at DESC')
  end

  def index
    @users = User.all.order('created_at ASC')
  end

end
