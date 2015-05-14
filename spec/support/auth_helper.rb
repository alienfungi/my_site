module AuthHelper
  def log_in_as(user, options = {})
    password = options.fetch(:password, 'password')
    remember_me = options.fetch(:remember_me, true)
    page.driver.post(login_path, session: {
      email: user.email, password: password, remember_me: remember_me
    })
  end
end
