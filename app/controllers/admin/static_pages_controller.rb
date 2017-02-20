class Admin::StaticPagesController < Admin::ApplicationController
  authorize_resource
  def home
  end
end
