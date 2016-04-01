class UsersController < ApplicationController

  def sign_out
    current_user.user_session.destroy
    redirect_to root
  end

end
