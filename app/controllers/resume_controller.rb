class ResumeController < ApplicationController
  before_action :set_resume

  def show
    respond_to do |format|
      format.html
      format.text do
        text = render_to_string('show.text')
        filename = "#{ @resume.filename }.txt"
        send_data text, filename: filename, type: 'text/plain'
      end
      format.pdf do
        pdf = ResumePdf.new(@resume, view_context)
        filename = "#{ @resume.filename }.pdf"
        send_data pdf.render, filename: filename, type: 'application/pdf'
      end
    end
  end

  private

  def set_resume
    @resume = Resume.new
  end
end
