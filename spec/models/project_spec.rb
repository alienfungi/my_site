# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  image       :string
#  link        :string
#  source_link :string
#  created_at  :datetime
#  updated_at  :datetime
#

require 'rails_helper'

RSpec.describe Project do
  it 'is invalid without name' do
    project = FactoryBot.build :project, name: nil
    project.valid?
    expect(project.errors[:name]).to include("can't be blank")
  end

  it 'is invalid without description' do
    project = FactoryBot.build :project, description: nil
    project.valid?
    expect(project.errors[:description]).to include("can't be blank")
  end
end
