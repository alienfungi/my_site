# == Schema Information
#
# Table name: certifications
#
#  id            :integer          not null, primary key
#  date_acquired :date             not null
#  name          :string(255)      not null
#  organization  :string(255)      not null
#  score         :string(255)
#

class Certification < ActiveRecord::Base
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
