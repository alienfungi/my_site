class AdminController < ApplicationController
  before_action :check_authorization

  def home
  end

  protected

  def check_authorization
    not_found unless logged_in?
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
end
