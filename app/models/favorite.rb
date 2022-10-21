class Favorite < ApplicationRecord
  belongs_to :user_step_log
  belongs_to :user
  validates_uniqueness_of :user_step_log_id, scope: :user_id
end
