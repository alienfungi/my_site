# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#  slug       :string(255)      not null
#

FactoryBot.define do
  factory :tag do
    name { Forgery('basic').color }
  end
end
