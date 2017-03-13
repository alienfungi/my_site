# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  image       :string(255)
#  link        :string(255)
#  source_link :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

require 'rails_helper'

RSpec.describe Project do
  it 'is invalid without name' do
    project = FactoryGirl.build :project, name: nil
    project.valid?
    expect(project.errors[:name]).to include("can't be blank")
  end

  it 'is invalid without description' do
    project = FactoryGirl.build :project, description: nil
    project.valid?
    expect(project.errors[:description]).to include("can't be blank")
  end
end
