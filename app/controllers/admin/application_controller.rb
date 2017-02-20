class Admin::ApplicationController < ActionController::Base
  include SessionsHelper

  protect_from_forgery with: :exception
  layout 'admin/layouts/application'

  #before_action :check_authorization
  before_action :set_view_path
  before_action :set_paper_trail_whodunnit

  private

  def check_authorization
    not_found unless logged_in?
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  def set_view_path
    prepend_view_path "app/views/admin"
  end
end
