module Mercury
  module Authentication
    include SessionsHelper

    def can_edit?
      logged_in?
    end
  end
end
