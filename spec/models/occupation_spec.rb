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
  it 'is valid with company, start_date, and title' do
    occupation = Occupation.new(
      company: 'Spacely Sprockets',
      start_date: Date.today,
      title: 'Button Masher'
    )
    expect(occupation).to be_valid
  end

  it 'is invalid without company' do
    occupation = Occupation.new(
      start_date: Date.today, title: 'Button Masher'
    )
    occupation.valid?
    expect(occupation.errors[:company]).to include("can't be blank")
  end

  it 'is invalid without start_date' do
    occupation = Occupation.new(
      company: 'Spacely Sprockets', title: 'Button Masher'
    )
    occupation.valid?
    expect(occupation.errors[:start_date]).to include("can't be blank")
  end

  it 'is invalid without title' do
    occupation = Occupation.new(
      company: 'Spacely Sprockets', start_date: Date.today
    )
    occupation.valid?
    expect(occupation.errors[:title]).to include("can't be blank")
  end
end
