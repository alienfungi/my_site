# == Schema Information
#
# Table name: taggings
#
#  id            :integer          not null, primary key
#  tag_id        :integer
#  taggable_id   :integer
#  taggable_type :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

class Tagging < ApplicationRecord
  belongs_to :taggable, polymorphic: true
  belongs_to :tag

  before_destroy :decrement_tag_count
  after_create :increment_tag_count

  private

  def count_key
    "#{ taggable_type.downcase.pluralize }_count"
  end

  def decrement_tag_count
    count = (tag.send(count_key) || 1).to_i - 1
    tag.send("#{ count_key }=", count)
    tag.save
  end

  def increment_tag_count
    count = (tag.send(count_key) || 0).to_i + 1
    tag.send("#{ count_key }=", count)
    tag.save
  end
end
