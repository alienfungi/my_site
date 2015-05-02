# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

class Tag < ActiveRecord::Base
  has_many :taggings, dependent: :destroy
  has_many :occupations, through: :taggings, source: :taggable, source_type: 'Occupation'

  normalize_attribute :name, with: :squish

  validates_presence_of :name
  validates_uniqueness_of :name, case_sensitive: false

  scope :alphabetical, ->{ order('lower(name)') }
end
