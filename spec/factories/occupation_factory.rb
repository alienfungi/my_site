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
#

FactoryGirl.define do
  factory :occupation do
    company { Forgery('name').company_name }
    company_url { Forgery('internet').domain_name }
    company_description { Forgery('lorem_ipsum').paragraph }
    title { Forgery('name').job_title }
    city { Forgery('address').city }
    state { Forgery('address').state }
    start_date { Forgery('date').date }
    end_date { |o| o.start_date + (1 + rand(777)).days }
    details do
      (3 + rand(6)).times.map do
        Forgery('lorem_ipsum').sentence
      end
    end

    factory :current_occupation do
      end_date nil
    end
  end
end
