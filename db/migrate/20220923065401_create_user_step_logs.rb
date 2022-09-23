class CreateUserStepLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :user_step_logs do |t|
      t.references :user, foreign_key: true
      t.integer :steps
      t.integer :favorite

      t.timestamps
    end
  end
end
