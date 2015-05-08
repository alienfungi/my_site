require 'rails_helper'

RSpec.describe Tag do
  it 'is valid with name' do
    tag = Tag.new(name: 'Ruby')
    expect(tag).to be_valid
  end

  it 'is invalid without a name' do
    tag = Tag.new
    tag.valid?
    expect(tag.errors[:name]).to include("can't be blank")
  end

  it 'is invalid with a duplicate name of any case' do
    Tag.create(name: 'Ruby')
    tag = Tag.new(name: 'rUBy')
    tag.valid?
    expect(tag.errors[:name]).to include("has already been taken")
  end
end
