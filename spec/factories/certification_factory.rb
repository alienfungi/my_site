# == Schema Information
#
# Table name: certifications
#
#  id            :integer          not null, primary key
#  date_acquired :date             not null
#  name          :string(255)      not null
#  organization  :string(255)      not null
#  score         :string(255)
#

FactoryGirl.define do
  factory :certification do
    name { Forgery('name').job_title }
    organization { Forgery('name').company_name }
    date_acquired { Forgery('date').date }
    score { "#{ 61 + rand(40) }%" }
  end
end
