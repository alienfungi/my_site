require 'rails_helper'

RSpec.describe Education do
  it 'is valid with school and start_date' do
    education = Education.new(school: 'Key West High', start_date: Date.today)
    expect(education).to be_valid
  end

  it 'is invalid without a school' do
    education = Education.new(start_date: Date.today)
    education.valid?
    expect(education.errors[:school]).to include("can't be blank")
  end

  it 'is invalid without a start_date' do
    education = Education.new(school: 'Key West High')
    education.valid?
    expect(education.errors[:start_date]).to include("can't be blank")
  end
end
