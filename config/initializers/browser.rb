Rails.configuration.middleware.use Browser::Middleware do
  destination =
    case
    when browser.ie?(8)
      'ie8'
    else
      nil
    end
  redirect_to "/browser/#{ destination }" if destination
end
