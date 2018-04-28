# == Schema Information
#
# Table name: occupations
#
#  id                  :integer          not null, primary key
#  company             :string(255)      not null
#  company_url         :string(255)
#  company_description :text
#  title               :string(255)      not null
#  start_date          :date             not null
#  end_date            :date
#  details             :text             default([]), is an Array
#  created_at          :datetime
#  updated_at          :datetime
#  city                :string(255)
#  state               :string(255)
#

FactoryBot.define do
  factory :occupation do
    company { Faker::Company.name }
    company_url { Faker::Internet.url }
    company_description { Faker::Lorem.paragraph }
    title { Faker::Job.title }
    city { Faker::Address.city}
    state { Faker::Address.state }
    start_date { Faker::Date.backward }
    end_date do |object|
      object.start_date + (1 + rand(777)).days if object.start_date
    end
    details do
      (3 + rand(6)).times.map do
        Faker::Lorem.sentence
      end
    end

    factory :current_occupation do
      end_date nil
    end
  end
end
