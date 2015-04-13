class OccupationsController < AdminController
  before_action :set_occupation, only: [:destroy, :edit, :show, :update]
  before_action :set_occupations, only: [:index]

  def create
    @occupation = Occupation.new(occupation_params)
    if @occupation.save
      flash[:success] = "Successfully created \"#{ @occupation.title }\""
      redirect_to occupations_path
    else
      flash[:error] = "Failed to create occupation"
      redirect_to :back
    end
  end

  def destroy
    if @occupation.destroy
      flash[:success] = 'Successfully destroyed an occupation'
    else
      flash[:error] = "Failed to destroy \"#{ @occupation.title }\""
    end
    redirect_to :back
  end

  def edit
  end

  def index
  end

  def new
    @occupation = Occupation.new
  end

  def show
  end

  def update
    if @occupation.update_attributes(occupation_params)
      flash[:success] = "Successfully updated \"#{ @occupation.title }\""
    else
      flash[:error] = "Failed to update \"#{ @occupation.title }\""
    end
    redirect_to occupations_path
  end

  private

  def occupation_params
    params.require(:occupation).permit(
      :company, :company_description, :company_url,
      :end_date, :start_date, :title, details: []
    )
  end

  def set_occupation
    @occupation = Occupation.find(params[:id])
  end

  def set_occupations
    @occupations = Occupation.by_date.all
  end
end
