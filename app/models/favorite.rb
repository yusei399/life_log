class Favorite < ApplicationRecord
  belongs_to :user_step_logs
  belongs_to :user
end
