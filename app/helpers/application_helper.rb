module ApplicationHelper
  include SessionsHelper

  # Depends on @regions being set in ApplicationController
  def inline_editable(region_name)
    content = @regions[region_name.to_sym]
    attributes =
      if logged_in?
        {
          id: "mercury_#{ region_name }",
          data: {
            action: params[:action],
            controller: params[:controller],
            mercury: 'full',
            name: region_name
          }
        }
      else
        {}
      end
    content_tag :div, raw(content), attributes
  end

  def nav_links
    {
      'Home' => root_path,
      'Resume' => resume_path,
      'Projects' => projects_path,
      'Skills' => tags_path,
      'Blog' => posts_path
    }
  end
end
