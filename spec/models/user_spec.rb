require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    user1 = User.new(first_name: "Any name", last_name: "Any lastname", email: "test@test.com", password: "password", password_confirmation:"password")
    puts user1.password_confirmation
    puts user1.password

    it "is valid with valid attributes" do
      user1 = User.new(first_name: "Any name", last_name: "Any lastname", email: "test@test.com", password: "password", password_confirmation:"password")
      expect(user1).to be_valid
    end

    it "is not valid where password_confirmation is blank/nil" do
      user1 = User.new(first_name: "Any name", last_name: "Any lastname", email: "test@test.com", password: "password", password_confirmation:"password")
      user1.password_confirmation = nil
      expect(user1).to_not be_valid
    end

    it "is not valid where password is blank/nil" do
      user1 = User.new(first_name: "Any name", last_name: "Any lastname", email: "test@test.com", password: "password", password_confirmation:"password")
      user1.password = nil
      expect(user1).to_not be_valid
    end

    it "is not valid where password & password_confirmation do not match" do
      user1 = User.new(first_name: "Any name", last_name: "Any lastname", email: "test@test.com", password: "password", password_confirmation:"password")
      user1.password = "other"
      expect(user1).to_not be_valid
    end

    it "is not valid where emails is not unique (case sensitive)" do
      user1 = User.create(first_name: "Any name", last_name: "Any lastname", email: "test@test.com", password: "password", password_confirmation:"password")
      user2 = User.create(first_name: "Any name", last_name: "Any lastname", email: "test@TEST.com", password: "password", password_confirmation:"password")
      expect(user2).to_not be_valid
    end

    it "is not valid where there is not first name" do
      user1 = User.create( last_name: "Any lastname", email: "test@test.com", password: "password", password_confirmation:"password")
      expect(user1).to_not be_valid
    end

    it "is not valid where there is not lastname" do
      user1 = User.create(first_name: "Any name", email: "test@test.com", password: "password", password_confirmation:"password")
      expect(user1).to_not be_valid
    end

    it "is not valid where there is not lastname" do
      user1 = User.create(first_name: "Any name", email: "test@test.com", password: "password", password_confirmation:"password")
      expect(user1).to_not be_valid
    end

    it "is not valid where there is not email" do
      user1 = User.create(first_name: "Any name", password: "password", password_confirmation:"password")
      expect(user1).to_not be_valid
    end

  end
end
