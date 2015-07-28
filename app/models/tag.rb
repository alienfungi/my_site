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

class Tag < ActiveRecord::Base
  has_many :taggings, dependent: :destroy
  has_many :certifications, through: :taggings, source: :taggable, source_type: 'Certification'
  has_many :educations, through: :taggings, source: :taggable, source_type: 'Education'
  has_many :occupations, through: :taggings, source: :taggable, source_type: 'Occupation'
  has_many :projects, through: :taggings, source: :taggable, source_type: 'Project'

  normalize_attribute :name, with: :squish

  validates_presence_of :name
  validates_uniqueness_of :name, case_sensitive: false

  before_validation :set_slug

  scope :alphabetical, ->{ order('lower(name)') }

  private

  def set_slug
    self.slug = self.name.gsub(/\s+/, '_')
  end
end
