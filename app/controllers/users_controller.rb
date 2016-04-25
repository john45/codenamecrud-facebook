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
    @users = User.paginate(page: params[:page]).order('created_at ASC')
    @responders = responders_for_current_user(current_user)
  end

  def friends_and_confirm

  end

  def request_to_friend
    @friendship = Friendship.new(incoming_params)
    if @friendship.save
      flash[:notice] = 'Запрос в друзья успешно отправлен'
      redirect_to users_path
    else
      flash[:alert] = 'Запрос в друзья не отправлен'
      redirect_to users_path
    end
  end

  private

    def incoming_params
      params.permit(:requester_id, :responder_id)
    end

    def responders_for_current_user(current_user)
      list_id = []
      list_of_friendships_without_conf = current_user.friendships.where(confirmation: nil).to_a
      list_of_friendships_without_conf.each do |fr|
        list_id << fr[:responder_id]
      end
      list_id
    end
end
