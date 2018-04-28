# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string(255)      not null
#  slug       :string(255)      not null
#  summary    :text             not null
#  body       :text             not null
#  private    :boolean          default(FALSE), not null
#  created_at :datetime
#  updated_at :datetime
#

FactoryBot.define do
  factory :post do
    title { Faker::Beer.name }
    summary { Faker::Lorem.sentence }
    body { Faker::Lorem.paragraph }
  end
end
