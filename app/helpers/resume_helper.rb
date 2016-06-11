module ResumeHelper
  def certification_heading(certification)
    certification.name
  end

  def certification_time(certification)
    certification.date_acquired.strftime('%B %Y')
  end

  def date_range(start_date, end_date)
    format = '%B %Y'
    range = "#{ start_date.strftime(format) } - "
    range += end_date ? end_date.strftime(format) : 'Present'
    range
  end

  def education_heading(education)
    heading = education.school
    heading += ', ' if education.city? || education.state?
    if education.city?
      heading += education.city
      heading += ', ' if education.state?
    end
    heading += education.state if education.state?
    heading
  end

  def education_time(education)
    date_range(education.start_date, education.end_date)
  end

  def education_description(education)
    if education.degree? && education.field_of_study?
      "#{ education.degree } in #{ education.field_of_study }"
    elsif education.degree?
      education.degree
    elsif education.field_of_study?
      "Field of study: #{ education.field_of_study }"
    else
      ''
    end
  end

  def occupation_heading(occupation)
    heading = occupation.company
    heading += ", #{ occupation.city }" if occupation.city?
    heading += ", #{ occupation.state }" if occupation.state?
    heading
  end

  def occupation_time(occupation)
    date_range(occupation.start_date, occupation.end_date)
  end
end
