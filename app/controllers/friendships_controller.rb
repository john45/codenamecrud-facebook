class FriendshipsController < ApplicationController
  def index
    @user_without_conf = current_user.friendships.where(confirmation: nil)
  end
end
