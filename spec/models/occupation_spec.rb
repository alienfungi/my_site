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

require 'rails_helper'

RSpec.describe Occupation do
  it 'is invalid without company' do
    occupation = FactoryGirl.build :occupation, company: nil
    occupation.valid?
    expect(occupation.errors[:company]).to include("can't be blank")
  end

  it 'is invalid without start_date' do
    occupation = FactoryGirl.build :occupation, start_date: nil
    occupation.valid?
    expect(occupation.errors[:start_date]).to include("can't be blank")
  end

  it 'is invalid without title' do
    occupation = FactoryGirl.build :occupation, title: nil
    occupation.valid?
    expect(occupation.errors[:title]).to include("can't be blank")
  end
end
