# == Schema Information
#
# Table name: regions
#
#  id         :integer          not null, primary key
#  content    :text             not null
#  controller :string           not null
#  action     :string           not null
#  name       :string           not null
#  created_at :datetime
#  updated_at :datetime
#

class Region < ApplicationRecord
  validates_presence_of :action, :content, :controller, :name
  validates_uniqueness_of :name, scope: [:controller, :action]
end
