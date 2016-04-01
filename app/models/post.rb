class Post < ActiveRecord::Base
  belongs_to :user

  validates :user_id, presence: true
  validates :message, presence: true, length: {minimum: 1, maximum: 200}



end
