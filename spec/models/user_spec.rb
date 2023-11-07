require 'rails_helper'



RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "validates presence of password" do
      user = User.new(email: 'user@example.com', password: nil, password_confirmation: 'password')
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "validates password and password_confirmation match" do
      user = User.new(email: 'user@example.com', password: 'password', password_confirmation: 'different_password')
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it "validates presence of email" do
      user = User.new(email: nil, password: 'password', password_confirmation: 'password')
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "validates presence of name" do
      user = User.new(name: nil, email: 'user@example.com', password: 'password', password_confirmation: 'password')
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end

    it "validates length of password" do
      user = User.new(email: 'user@example.com', password: 'pass', password_confirmation: 'pass')
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 8 characters)")
    end




  end
end
