class AdminController < ApplicationController
  http_basic_authenticate_with(
    name: (ENV['MY_SITE_MY_USERNAME'] || raise('Admin user not configured')),
    password: (ENV['MY_SITE_MY_PASSWORD'] || raise('Admin user not configured'))
  )

  def home
  end
end
