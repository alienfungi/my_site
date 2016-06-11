class ResumeController < ApplicationController
  before_action :set_resume

  def show
    respond_to do |format|
      format.html
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
