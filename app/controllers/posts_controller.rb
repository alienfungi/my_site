class PostsController < ApplicationController
  def index
    @posts = Post.live.by_date
  end

  def show
    @post = Post.live.find_by_slug(params[:slug])
    @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  end
end
