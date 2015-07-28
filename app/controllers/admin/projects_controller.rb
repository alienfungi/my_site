class Admin::ProjectsController < Admin::ApplicationController
  before_action :set_project, only: [:destroy, :edit, :show, :update]
  before_action :set_projects, only: [:index]
  before_action :set_tags, only: [:edit, :new]

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:success] = "Successfully created \"#{ @project.name }\""
      redirect_to admin_projects_path
    else
      flash[:error] = "Failed to create project"
      set_tags
      render 'new'
    end
  end

  def destroy
    if @project.destroy
      flash[:success] = 'Succesfully destroyed a project'
    else
      flash[:error] = "Failed to destroy \"#{ @project.name }\""
    end
    redirect_to :back
  end

  def edit
  end

  def index
  end

  def new
    @project = Project.new
  end

  def show
  end

  def update
    if @project.update_attributes(project_params)
      flash[:success] = "Successfully updated \"#{ @project.name }\""
      redirect_to admin_projects_path
    else
      flash[:error] = "Failed to update project"
      set_tags
      render 'edit'
    end
  end

  private

  def project_params
    params.require(:project).permit(
      :description, :image, :link, :name, :source_link, tag_ids: []
    )
  end

  def set_project
    @project = Project.find(params[:id])
  end

  def set_projects
    @projects = Project.alphabetical
  end

  def set_tags
    @tags = Tag.alphabetical
  end
end
