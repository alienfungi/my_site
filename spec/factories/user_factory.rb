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

FactoryBot.define do
  factory :user do
    email 'email@example.com'
    password 'password'
    password_confirmation 'password'
  end
end
