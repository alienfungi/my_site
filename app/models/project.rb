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

class Project < ActiveRecord::Base
  validates_presence_of :name, :description
  validates_uniqueness_of :name

  normalize_attribute :name, with: :squish

  scope :alphabetical, ->{ order('lower(name)') }
end
