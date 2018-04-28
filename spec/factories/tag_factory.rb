# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#  slug       :string(255)      not null
#  metadata   :hstore           not null
#

FactoryBot.define do
  factory :tag do
    name { Faker::Color.color_name }
  end
end
