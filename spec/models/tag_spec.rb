# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime
#  updated_at :datetime
#  slug       :string           not null
#  metadata   :hstore           not null
#

require 'rails_helper'

RSpec.describe Tag do
  it 'is invalid without a name' do
    tag = FactoryBot.build :tag, name: nil
    tag.valid?
    expect(tag.errors[:name]).to include("can't be blank")
  end

  it 'is invalid with a duplicate name of any case' do
    FactoryBot.create :tag, name: 'Ruby'
    tag = FactoryBot.build :tag, name: 'rUBy'
    tag.valid?
    expect(tag.errors[:name]).to include("has already been taken")
  end
end
