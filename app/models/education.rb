# == Schema Information
#
# Table name: educations
#
#  id             :integer          not null, primary key
#  school         :string(255)      not null
#  city           :string(255)
#  state          :string(255)
#  field_of_study :string(255)
#  degree         :string(255)
#  start_date     :date             not null
#  end_date       :date
#  created_at     :datetime
#  updated_at     :datetime
#

class Education < ActiveRecord::Base
  validates_presence_of :school, :start_date

  scope :by_date, ->{ order('start_date DESC') }

  def max_year
    Date.today.year
  end

  def min_year
    BIRTHDAY.year
  end
end
