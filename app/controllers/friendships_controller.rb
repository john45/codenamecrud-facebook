class FriendshipsController < ApplicationController
  def index

    @friends = User.friendships.where.not(confirmation: nil)
    @user = current_user.friendships.where(confirmation: nil)
  end
end
