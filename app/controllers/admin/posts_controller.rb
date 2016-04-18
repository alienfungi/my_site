class Admin::PostsController < Admin::ApplicationController
  before_action :set_post, only: [:destroy, :edit, :show, :update]
  before_action :set_posts, only: [:index]

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "Successfully created \"#{ @post.title }\""
      redirect_to admin_posts_path
    else
      flash[:error] = "Failed to create post"
      render 'new'
    end
  end

  def destroy
    if @post.destroy
      flash[:success] = 'Successfully destroyed a post'
    else
      flash[:error] = "Failed to destroy \"#{ @post.title }\""
    end
    redirect_to :back
  end

  def edit
  end

  def index
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  end

  def update
    if @post.update_attributes(post_params)
      flash[:success] = "Successfully updated \"#{ @post.title }\""
      redirect_to admin_posts_path
    else
      flash[:error] = "Failed to update \"#{ @post.title }\""
      render 'edit'
    end
  end

  private

  def post_params
    params.require(:post).permit(:body, :private, :slug, :summary, :title)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def set_posts
    @posts = Post.by_date
  end
end
