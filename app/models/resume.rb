class Resume
  attr_reader :certifications, :educations, :filename, :occupations

  def initialize
    @certifications = Certification.by_date
    @educations = Education.by_date
    @occupations = Occupation.by_date
    @filename = "resume - Zane Woodfin #{ Time.now.strftime('%Y-%m-%d') }"
  end
end
