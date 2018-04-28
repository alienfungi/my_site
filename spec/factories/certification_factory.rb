# == Schema Information
#
# Table name: certifications
#
#  id            :integer          not null, primary key
#  date_acquired :date             not null
#  name          :string           not null
#  organization  :string           not null
#  score         :string
#

FactoryBot.define do
  factory :certification do
    name { Faker::Job.key_skill }
    organization { Faker::Company.name }
    date_acquired { Faker::Date.backward }
    score { "#{ 61 + rand(40) }%" }
  end
end
