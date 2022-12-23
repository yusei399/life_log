require 'rails_helper'

RSpec.describe User, type: :model do
    it "is valid with a first name, last name, email, and password"
    # 名がなければ無効な状態であること
    it "is invalid without a first name" do
      user = User.new(first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end
    # 姓がなければ無効な状態であること
    it "is invalid without a last name"
    # メールアドレスがなければ無効な状態であること
    it "is invalid without an email address"
    # 重複したメールアドレスなら無効な状態であること
    it "is invalid with a duplicate email address"
    # ユーザーのフルネームを文字列として返すこと
    it "returns a user's full name as a string"

    it "has a valid factory" do
      expect(FactoryBot.build(:user)).to be_valid
    end

    it "is invalid without a first name" do
      user = FactoryBot.build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end

    it "is invalid without a last name" do
      user = FactoryBot.build(:user, last_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include("can't be blank")
    end

    it "is invalid without an email address" do
      user = FactoryBot.build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end
end
