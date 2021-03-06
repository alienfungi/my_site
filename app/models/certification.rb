# == Schema Information
#
# Table name: certifications
#
#  id            :integer          not null, primary key
#  date_acquired :date             not null
#  name          :string           not null
#  organization  :string           not null
#  score         :string
#

class Certification < ApplicationRecord
  has_many :taggings, as: :taggable
  has_many :tags, through: :taggings, dependent: :destroy

  validates_presence_of :date_acquired, :name, :organization

  scope :by_date, ->{ order('date_acquired DESC') }

  def max_year
    Date.today.year
  end

  def min_year
    BIRTHDAY.year
  end
end
