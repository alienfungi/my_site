# == Schema Information
#
# Table name: educations
#
#  id             :integer          not null, primary key
#  school         :string(255)      not null
#  city           :string(255)
#  state          :string(255)
#  field_of_study :string(255)
#  degree         :string(255)
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
