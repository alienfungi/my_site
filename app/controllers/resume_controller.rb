class ResumeController < ApplicationController
  before_action :set_certifications
  before_action :set_educations
  before_action :set_occupations

  def show
  end

  private

  def set_certifications
    @certifications = Certification.by_date
  end

  def set_educations
    @educations = Education.by_date
  end

  def set_occupations
    @occupations = Occupation.by_date
  end
end
