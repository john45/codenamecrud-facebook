class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts


  has_many :friendships, foreign_key: 'requester_id', dependent: :destroy
  has_many :reverse_friendships, foreign_key: "responder_id",
                             class_name: "Friendship"


  has_many :requesters, through: :friendships, source: :requester
  has_many :responders, through: :reverse_friendships, source: :responder


  def add_to_friends!(other_user)
    friendships.create!(responder_id: other_user.id)
  end

  def follow_confirm!(other_user)
    friendships.find_by(requester_id: other_user.id).update()
  end

  def confirm?(other_user)
    friendships.find_by(responder_id: other_user.id, confirmation: '')
  end

  def confirm!()
  end


end
