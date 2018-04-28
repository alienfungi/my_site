# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  remember_digest :string
#  created_at      :datetime
#  updated_at      :datetime
#

require 'rails_helper'

RSpec.describe User do
  it 'is invalid without email' do
    user = FactoryBot.build :user, email: nil
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it 'is invalid without password' do
    user = FactoryBot.build :user, password: nil
    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
  end

  it "is invalid if password and password confirmation don't match" do
    user = FactoryBot.build :user, password: 'dog', password_confirmation: 'cat'
    user.valid?
    expect(user.errors[:password_confirmation]).to include("doesn't match Password")
  end

  it 'is invalid if the email has already been taken' do
    FactoryBot.create :user, email: 'email@example.com'
    user = FactoryBot.build :user, email: 'email@example.com'
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end
end
