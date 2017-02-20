class Admin::EducationsController < Admin::ApplicationController
  before_action :set_education, only: [:destroy, :edit, :show, :update]
  before_action :set_educations, only: [:index]
  before_action :set_tags, only: [:edit, :new]
  authorize_resource

  def create
    @education = Education.new(education_params)
    if @education.save
      flash[:success] = "Successfully created \"#{ @education.school }\""
      redirect_to admin_educations_path
    else
      flash[:error] = "Failed to create education"
      set_tags
      render 'new'
    end
  end

  def destroy
    if @education.destroy
      flash[:success] = 'Successfully destroyed an education'
    else
      flash[:error] = "Failed to destroy \"#{ @education.school }\""
    end
    redirect_to :back
  end

  def edit
  end

  def index
  end

  def new
    @education = Education.new
  end

  def show
  end

  def update
    if @education.update_attributes(education_params)
      flash[:success] = "Successfully updated \"#{ @education.school }\""
      redirect_to admin_educations_path
    else
      flash[:error] = "Failed to update \"#{ @education.school }\""
      set_tags
      render 'edit'
    end
  end

  private

  def education_params
    params.require(:education).permit(
      :city, :degree, :end_date, :field_of_study, :school, :start_date, :state,
      tag_ids: []
    )
  end

  def set_education
    @education = Education.find(params[:id])
  end

  def set_educations
    @educations = Education.by_date.all
  end

  def set_tags
    @tags = Tag.alphabetical
  end
end
