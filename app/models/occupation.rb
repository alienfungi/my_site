# == Schema Information
#
# Table name: occupations
#
#  id                  :integer          not null, primary key
#  company             :string           not null
#  company_url         :string
#  company_description :text
#  title               :string           not null
#  start_date          :date             not null
#  end_date            :date
#  details             :text             default([]), is an Array
#  created_at          :datetime
#  updated_at          :datetime
#  city                :string
#  state               :string
#

class Occupation < ApplicationRecord
  has_many :taggings, as: :taggable
  has_many :tags, through: :taggings

  validates_presence_of :company, :start_date, :title

  before_validation :prepare_details

  scope :by_date, ->{ order('start_date DESC') }

  def max_year
    Date.today.year
  end

  def min_year
    BIRTHDAY.year
  end

  private

  def prepare_details
    details_will_change!
    details.reject! { |detail| detail.blank? }
  end
end
