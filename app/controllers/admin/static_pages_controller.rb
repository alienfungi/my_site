class Admin::StaticPagesController < Admin::ApplicationController
  def home
    authorize! :read, :home
  end
end
