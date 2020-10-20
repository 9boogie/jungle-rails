require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Valications' do

    before do
      @user = User.create!(name: 'Jae', email: 'test@test.com', password: 'password', password_confirmation: 'password' )
    end

    it 'validate with name' do
      expect(@user).to respond_to(:name)
    end

    it 'validate with email' do
      expect(@user).to respond_to(:email)
    end

    it 'validate with password' do
      expect(@user).to respond_to(:password)
    end

    it 'validate with password_confirmation' do
      expect(@user).to respond_to(:password_confirmation)
    end

    it 'password and password_confirmation must be equal' do
      user0 = User.new(name: 'Ash', email: 'tyto@password.com', password: 'password', password_confirmation: '123456' )
      user0.valid?
      expect(user0.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'Emails must be unique' do
      user1 = User.new(name: 'Ash', email: 'TEST@test.com', password: '123456', password_confirmation: '123456' )
      user1.valid?
      expect(user1.errors.full_messages).to include("Email has already been taken")
    end

    it 'Password cannot be less than 5 words' do
      user2 = User.new(name: 'Rookie', email: 'rookie@new.com', password: '1234', password_confirmation: '1234' )
      user2.valid?
      expect(user2.errors.full_messages).to include("Password is too short (minimum is 5 characters)")
    end
  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
    before do
      @tester = User.create!(name: 'spacer', email: 'eXample@domain.COM', password: 'password', password_confirmation: 'password' )
    end

    it 'pass authenticate with spaces before/after email' do
      expect(User.authenticate_with_credentials(" eXample@domain.COM ", "password")).to eq(@tester)
    end

    it 'pass authenticate with wrong case on the email' do
      expect(User.authenticate_with_credentials("EXAMPLe@DOMAIN.CoM", "password")).to eq(@tester)
    end

  end

end
