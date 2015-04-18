class EducationsController < AdminController
  before_action :set_education, only: [:destroy, :edit, :show, :update]
  before_action :set_educations, only: [:index]

  def create
    @education = Education.new(education_params)
    if @education.save
      flash[:success] = "Successfully created \"#{ @education.school }\""
      redirect_to educations_path
    else
      flash[:error] = "Failed to create education"
      redirect_to :back
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
      redirect_to educations_path
    else
      flash[:error] = "Failed to update \"#{ @education.school }\""
      render 'edit'
    end
  end

  private

  def education_params
    params.require(:education).permit(
      :city, :degree, :end_date, :field_of_study, :school, :start_date, :state
    )
  end

  def set_education
    @education = Education.find(params[:id])
  end

  def set_educations
    @educations = Education.by_date.all
  end
end
