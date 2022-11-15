class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  has_many :user_step_logs, dependent: :destroy
  has_many :favorites, dependent: :destroy 
  has_many :favorited_user_step_logs, through: :favorites, source: :user_step_log
  has_many :group_users
  has_many :groups, through: :group_users
  def already_favorited?(user_step_log)
    self.favorites.exists?(user_step_log_id: user_step_log.id)
  end
  def self.looks(search, word)
    if search == "perfect_match"
      @user = User.where("name LIKE?", "#{word}")
    elsif search == "forward_match"
      @user = User.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
      @user = User.where("name LIKE?","%#{word}")
    elsif search == "partial_match"
      @user = User.where("name LIKE?","%#{word}%")
    else
      @user = User.all
    end
  end
end
