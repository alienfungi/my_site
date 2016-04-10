class ApplicationController < ActionController::Base
  include SessionsHelper

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_regions

  private

  def set_regions
    @regions =
      Region.where(
        controller: params[:controller], action: params[:action]
      ).load.inject({}) do |results, region|
        results[region.name.to_sym] = region.content
        results
      end
  end
end
