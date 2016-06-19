module ApplicationHelper
  include SessionsHelper

  def graceful_none(item, none = '-')
    if item.blank? || item == 0 || item == '0'
      none
    else
      item
    end
  end

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
      'Experience' => tags_path,
      'Blog' => posts_path
    }
  end

  def nav_class(link, path)
    if (link == '/' && path == link) || (link != '/' && path.match(/\A#{ link }/i))
      'selected'
    else
      ''
    end
  end
end
