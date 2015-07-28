class TagsController < ApplicationController
  def index
    @tags = Tag.alphabetical
  end

  def show
    @tag = Tag.find_by_slug(params[:slug])
  end
end
