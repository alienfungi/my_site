class Admin::ApplicationController < ActionController::Base
  include SessionsHelper

  protect_from_forgery with: :exception
  layout 'admin/layouts/application'

  before_action :set_view_path
  before_action :set_paper_trail_whodunnit

  rescue_from CanCan::AccessDenied do |exception|
    not_found
  end

  private

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  def set_view_path
    prepend_view_path "app/views/admin"
  end
end
