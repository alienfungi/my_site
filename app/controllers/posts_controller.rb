class PostsController < ApplicationController
  def index
    @posts = Post.by_date
  end

  def show
    @post = Post.find_by_slug(params[:slug])
    @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  end
end
