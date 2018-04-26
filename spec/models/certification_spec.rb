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

require 'rails_helper'

RSpec.describe Certification do
  it 'is invalid without date_acquired' do
    certification = FactoryBot.build :certification, date_acquired: nil
    certification.valid?
    expect(certification.errors[:date_acquired]).to include("can't be blank")
  end

  it 'is invalid without name' do
    certification = FactoryBot.build :certification, name: nil
    certification.valid?
    expect(certification.errors[:name]).to include("can't be blank")
  end

  it 'is invalid without organization' do
    certification = FactoryBot.build :certification, organization: nil
    certification.valid?
    expect(certification.errors[:organization]).to include("can't be blank")
  end
end
