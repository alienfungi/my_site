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

  before_validation :set_slug
  before_validation :set_summary

  scope :by_date, -> { order(created_at: :desc) }
  scope :live, -> { where(private: false) }

  def self.markdown_options
    {
      mark: true,
      quote: true,
      superscript: true,
      strikethrough: true,
      tables: true,
      underline: true
    }
  end

  def paper_trail_overrides
    [:private, :slug, :summary, :title]
  end

  def paper_trail_tracked
    [:body]
  end

  private

  def set_slug
    self.slug = title.parameterize if slug.blank?
  end

  def set_summary
    self.summary = body.truncate(155) if summary.blank?
  end
end
