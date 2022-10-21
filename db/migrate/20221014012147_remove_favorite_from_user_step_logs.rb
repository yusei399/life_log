class RemoveFavoriteFromUserStepLogs < ActiveRecord::Migration[7.0]
  def change
    remove_column :user_step_logs, :favorite, :integer
  end
end
