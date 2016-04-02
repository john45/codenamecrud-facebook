class UsersController < ApplicationController
  before_action :authenticate_user!

  def sign_out
    current_user.user_session.destroy
    redirect_to root
  end

  def show

  end

  def all_users
    @users = User.all
  end

end
