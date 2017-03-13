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

FactoryGirl.define do
  factory :education do
    school { Forgery('name').company_name }
    city { Forgery('address').city }
    state { Forgery('address').state }
    field_of_study { Forgery('name').job_title }
    degree { Forgery('name').job_title }
    start_date { Forgery('date').date }
    end_date do |object|
      object.start_date + (1 + rand(777)).days if object.start_date
    end

    factory :current_education do
      end_date nil
    end
  end
end
