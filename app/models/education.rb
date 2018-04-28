# == Schema Information
#
# Table name: educations
#
#  id             :integer          not null, primary key
#  school         :string           not null
#  city           :string
#  state          :string
#  field_of_study :string
#  degree         :string
#  start_date     :date             not null
#  end_date       :date
#  created_at     :datetime
#  updated_at     :datetime
#

class Education < ApplicationRecord
  has_many :taggings, as: :taggable
  has_many :tags, through: :taggings

  validates_presence_of :school, :start_date

  scope :by_date, ->{ order('start_date DESC') }

  def max_year
    Date.today.year
  end

  def min_year
    BIRTHDAY.year
  end
end
