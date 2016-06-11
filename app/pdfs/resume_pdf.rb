class ResumePdf < Prawn::Document
  def initialize(resume, view)
    super(margin: 72)
    @resume = resume
    @context = view
    font('Times-Roman', size: 10)
    heading
    move_down 40
    educations
    section_break
    certifications
    section_break
    occupations
  end

  private

  def heading
    text 'Paul "Zane" Woodfin', align: :center, style: :bold, size: 14
    text 'zanewoodfin@gmail.com', align: :center, size: 12
    text 'www.zanewoodfin.com', align: :center, size: 12
  end

  def educations
    text 'Education', style: :bold, size: 12
    indent(indent_size) do
      @resume.educations.each_with_index do |education, index|
        heading = @context.education_heading(education)
        time = @context.education_time(education)
        left_right_align(heading, time)
        text @context.education_description(education)
        subsection_break unless index == @resume.educations.size - 1
      end
    end
  end

  def certifications
    text 'Certifications', style: :bold, size: 12
    indent(indent_size) do
      @resume.certifications.each_with_index do |certification, index|
        heading = @context.certification_heading(certification)
        time = @context.certification_time(certification)
        left_right_align(heading, time)
        subsection_break unless index == @resume.certifications.size - 1
      end
    end
  end

  def indent_size
    20
  end

  def left_right_align(left, right)
    left_cell = make_cell(content: left, borders: [], padding: [0, 10, 0, 0])
    right_cell = make_cell(content: right, borders: [], padding: 0, align: :right)
    table [[left_cell, right_cell]], width: bounds.width
  end

  def occupations
    text 'Work Experience', style: :bold, size: 12
    indent(indent_size) do
      @resume.occupations.each_with_index do |occupation, index|
        text occupation.title, style: :bold
        heading = @context.occupation_heading(occupation)
        time = @context.occupation_time(occupation)
        left_right_align(heading, time)
        unordered_list(occupation.details)
        subsection_break unless index == @resume.occupations.length - 1
      end
    end
  end

  def section_break
    move_down 20
  end

  def subsection_break
    move_down 10
  end

  def unordered_list(items)
    return if items.empty?
    list = []
    items.each_with_index do |item, index|
      padding = (index == items.length - 1) ? 0 : [0, 0, 5, 0]
      bullet = make_cell(content: '•', borders: [], padding: padding, width: 10)
      value = make_cell(content: item, borders: [], padding: padding)
      list << [bullet, value]
    end
    table list
  end
end
