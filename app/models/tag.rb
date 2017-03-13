# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#  slug       :string(255)      not null
#  metadata   :hstore           default({}), not null
#

class Tag < ActiveRecord::Base
  require 'uri'

  has_many :taggings, dependent: :destroy
  has_many :certifications, through: :taggings, source: :taggable, source_type: 'Certification'
  has_many :educations, through: :taggings, source: :taggable, source_type: 'Education'
  has_many :occupations, through: :taggings, source: :taggable, source_type: 'Occupation'
  has_many :projects, through: :taggings, source: :taggable, source_type: 'Project'

  store_accessor :metadata,
    :certifications_count, :educations_count, :occupations_count, :projects_count

  normalize_attribute :name, with: :squish

  validates_presence_of :name
  validates_uniqueness_of :name, case_sensitive: false
  validate :slug_is_url_safe

  before_validation :set_slug
  before_save :update_metadata

  scope :alphabetical, ->{ order('lower(name)') }

  def self.regenerate_slugs
    find_each do |tag|
      tag.set_slug
      tag.save if tag.slug_changed?
    end
  end

  def set_slug
    self.slug = name.downcase.gsub(/\s+/, '-') if name
  end

  private

  def slug_is_url_safe
    begin
      URI.parse(slug)
    rescue URI::InvalidURIError
      errors.add(:name, 'contains invalid characters')
    end
  end

  def tag_types
    [:certifications, :educations, :occupations, :projects]
  end

  def update_metadata
    tag_types.each do |tag_type|
      count_key = "#{ tag_type }_count"
      count = self.send(tag_type).count
      metadata[count_key] = count
    end
    metadata_will_change!
  end
end
