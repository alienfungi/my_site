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
  it 'is valid with date_acquired, name, and organization' do
    certification = Certification.new(
      date_acquired: Date.today, name: 'Knight', organization: 'Teh Queen'
    )
    expect(certification).to be_valid
  end

  it 'is invalid without date_acquired' do
    certification = Certification.new(name: 'Knight', organization: 'Teh Queen')
    certification.valid?
    expect(certification.errors[:date_acquired]).to include("can't be blank")
  end

  it 'is invalid without name' do
    certification = Certification.new(
      date_acquired: Date.today, organization: 'Teh Queen'
    )
    certification.valid?
    expect(certification.errors[:name]).to include("can't be blank")
  end

  it 'is invalid without organization' do
    certification = Certification.new(date_acquired: Date.today, name: 'Knight')
    certification.valid?
    expect(certification.errors[:organization]).to include("can't be blank")
  end
end
