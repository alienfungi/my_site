class TagsController < AdminController
  before_action :set_tag, only: [:destroy, :edit, :show, :update]
  before_action :set_tags, only: [:index]

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      flash[:success] = "Successfully created \"#{ @tag.name }\""
      redirect_to tags_path
    else
      flash[:error] = "Failed to create tag"
      render 'new'
    end
  end

  def destroy
    if @tag.destroy
      flash[:success] = 'Succesfully destroyed a tag'
    else
      flash[:error] = "Failed to destroy \"#{ @tag.name }\""
    end
    redirect_to :back
  end

  def edit
  end

  def index
  end

  def new
    @tag = Tag.new
  end

  def show
  end

  def update
    if @tag.update_attributes(tag_params)
      flash[:success] = "Successfully updated \"#{ @tag.name }\""
      redirect_to tags_path
    else
      flash[:error] = "Failed to update \"#{ @tag.name }\""
      render 'edit'
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end

  def set_tag
    @tag = Tag.find(params[:id])
  end

  def set_tags
    @tags = Tag.all
  end
end
