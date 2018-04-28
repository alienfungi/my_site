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

class Project < ApplicationRecord
  has_many :taggings, as: :taggable
  has_many :tags, through: :taggings

  validates_presence_of :name, :description
  validates_uniqueness_of :name

  normalize_attribute :name, with: :squish

  scope :alphabetical, ->{ order('lower(name)') }
end
