class UserStepLog < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
