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

FactoryGirl.define do
  factory :project do
    name "MyString"
    description "MyText"
    image "MyString"
    link "MyString"
    source_link "MyString"
  end
end
