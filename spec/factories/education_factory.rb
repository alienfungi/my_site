# == Schema Information
#
# Table name: educations
#
#  id             :integer          not null, primary key
#  school         :string           not null
#  city           :string
#  state          :string
#  field_of_study :string
#  degree         :string
#  start_date     :date             not null
#  end_date       :date
#  created_at     :datetime
#  updated_at     :datetime
#

FactoryBot.define do
  factory :education do
    school { Faker::Educator.university }
    city { Faker::Address.city }
    state { Faker::Address.state }
    field_of_study { Faker::Job.field }
    degree { Faker::Educator.course }
    start_date { Faker::Date.backward }
    end_date do |object|
      object.start_date + (1 + rand(777)).days if object.start_date
    end

    factory :current_education do
      end_date nil
    end
  end
end
