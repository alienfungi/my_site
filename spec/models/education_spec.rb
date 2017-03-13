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

require 'rails_helper'

RSpec.describe Education do
  it 'is invalid without a school' do
    education = FactoryGirl.build :education, school: nil
    education.valid?
    expect(education.errors[:school]).to include("can't be blank")
  end

  it 'is invalid without a start_date' do
    education = FactoryGirl.build :education, start_date: nil
    education.valid?
    expect(education.errors[:start_date]).to include("can't be blank")
  end
end
