# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string(255)      not null
#  slug       :string(255)      not null
#  summary    :text             not null
#  body       :text             not null
#  private    :boolean          default(FALSE), not null
#  created_at :datetime
#  updated_at :datetime
#

class Post < ActiveRecord::Base
  has_paper_trail only: :body

  validates_presence_of :body, :slug, :summary, :title
  validates_uniqueness_of :slug, :title

  scope :by_date, -> { order(created_at: :desc) }
  scope :live, -> { where(private: false) }

  def paper_trail_overrides
    [:private, :slug, :summary, :title]
  end

  def paper_trail_tracked
    [:body]
  end
end
