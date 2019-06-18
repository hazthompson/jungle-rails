require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'validations' do
    user1 = User.new(first_name: "Any name", last_name: "Any lastname", email: "test@test.com", password: "password", password_confirmation:"password")

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
      user1 = User.new( last_name: "Any lastname", email: "test@test.com", password: "password", password_confirmation:"password")
      expect(user1).to_not be_valid
    end

    it "is not valid where there is not lastname" do
      user1 = User.new(first_name: "Any name", email: "test@test.com", password: "password", password_confirmation:"password")
      expect(user1).to_not be_valid
    end

    it "is not valid where there is not email" do
      user1 = User.new(first_name: "Any name", last_name: "Any lastname", password: "password", password_confirmation:"password")
      expect(user1).to_not be_valid
    end

    it "is not valid where password is less than 5 characters" do
      user1 =User.new(first_name: "Any name", last_name: "Any lastname", email: "test@test.com", password: "pass", password_confirmation:"pass")
      expect(user1).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    let!(:user1) { User.create(first_name: "Any name", last_name: "Any lastname", email: "test@test.com", password: "password", password_confirmation:"password") }

    it "returns nill if user credentials (password and email) do not match" do
      expect(User.authenticate_with_credentials(user1.email, "other")).to eq(nil)
    end

    it "returns user if user credentials (password and email) do match" do
      expect(User.authenticate_with_credentials(user1.email, "password")).to eq(user1)
    end

    it "returns nil if email dosn't match any users" do
      expect(User.authenticate_with_credentials("nomatch@email.com", "password")).to eq(nil)
    end
  end
  
end
