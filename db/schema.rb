# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_221_023_164_521) do
  create_table 'favorites', charset: 'utf8mb4', force: :cascade do |t|
    t.bigint 'user_step_log_id', null: false
    t.bigint 'user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_favorites_on_user_id'
    t.index ['user_step_log_id'], name: 'index_favorites_on_user_step_log_id'
  end

  create_table 'group_users', charset: 'utf8mb4', force: :cascade do |t|
    t.bigint 'group_id'
    t.bigint 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['group_id'], name: 'index_group_users_on_group_id'
    t.index ['user_id'], name: 'index_group_users_on_user_id'
  end

  create_table 'groups', charset: 'utf8mb4', force: :cascade do |t|
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'name', null: false
    t.bigint 'owner_id', null: false
    t.index ['name'], name: 'index_groups_on_name', unique: true
    t.index ['owner_id'], name: 'fk_rails_5447bdb9c5'
  end

  create_table 'user_step_logs', charset: 'utf8mb4', force: :cascade do |t|
    t.bigint 'user_id'
    t.integer 'steps'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_user_step_logs_on_user_id'
  end

  create_table 'users', charset: 'utf8mb4', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'name'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'favorites', 'user_step_logs'
  add_foreign_key 'favorites', 'users'
  add_foreign_key 'group_users', 'groups'
  add_foreign_key 'group_users', 'users'
  add_foreign_key 'groups', 'users', column: 'owner_id'
  add_foreign_key 'user_step_logs', 'users'
end
