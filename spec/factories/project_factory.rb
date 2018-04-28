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

FactoryBot.define do
  factory :project do
    name { "#{Faker::Color.color_name} #{Faker::Science.element}".titleize }
    description { Faker::Lorem.paragraph }
    image { Faker::Company.logo }
    link { Faker::Internet.url }
    source_link { Faker::Internet.url }
  end
end
