class Admin::CertificationsController < Admin::ApplicationController
  before_action :set_certification, only: [:destroy, :edit, :show, :update]
  before_action :set_certifications, only: [:index]
  before_action :set_tags, only: [:edit, :new]

  def create
    @certification = Certification.new(certification_params)
    if @certification.save
      flash[:success] = "Successfully created \"#{ @certification.name }\""
      redirect_to admin_certifications_path
    else
      flash[:error] = "Failed to create certification"
      set_tags
      render 'new'
    end
  end

  def destroy
    if @certification.destroy
      flash[:success] = 'Successfully destroyed a certification'
    else
      flash[:error] = "Failed to destroy \"#{ @certification.name }\""
    end
    redirect_to :back
  end

  def edit
  end

  def index
    @certification = Certification.new
  end

  def new
    @certification = Certification.new
  end

  def show
  end

  def update
    if @certification.update_attributes(certification_params)
      flash[:success] = "Successfully updated \"#{ @certification.name }\""
      redirect_to admin_certifications_path
    else
      flash[:error] = "Failed to update \"#{ @certification.name }\""
      set_tags
      render 'edit'
    end
  end

  private

  def certification_params
    params.require(:certification).permit(
      :date_acquired, :name, :organization, :score, tag_ids: []
    )
  end

  def set_certification
    @certification = Certification.find(params[:id])
  end

  def set_certifications
    @certifications = Certification.by_date.all
  end

  def set_tags
    @tags = Tag.alphabetical
  end
end
