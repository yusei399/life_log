class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|

      t.timestamps
      t.string :name, null: false
      t.bigint :owner_id, null: false
      t.index :name, unique: true
    end
    add_foreign_key :groups, :users, column: :owner_id
  end
end

