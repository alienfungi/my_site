class Admin::OccupationsController < Admin::ApplicationController
  before_action :set_occupation, only: [:destroy, :edit, :show, :update]
  before_action :set_occupations, only: [:index]
  before_action :set_tags, only: [:edit, :new]
  authorize_resource

  def create
    @occupation = Occupation.new(occupation_params)
    if @occupation.save
      flash[:success] = "Successfully created \"#{ @occupation.title }\""
      redirect_to admin_occupations_path
    else
      flash[:error] = "Failed to create occupation"
      set_tags
      render 'new'
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
      redirect_to admin_occupations_path
    else
      flash[:error] = "Failed to update \"#{ @occupation.title }\""
      set_tags
      render 'edit'
    end
  end

  private

  def occupation_params
    params.require(:occupation).permit(
      :city, :company, :company_description, :company_url,
      :end_date, :start_date, :state, :title,
      details: [], tag_ids: []
    )
  end

  def set_occupation
    @occupation = Occupation.find(params[:id])
  end

  def set_occupations
    @occupations = Occupation.by_date.all
  end

  def set_tags
    @tags = Tag.alphabetical
  end
end
