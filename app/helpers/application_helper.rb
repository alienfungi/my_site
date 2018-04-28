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
    content_tag :div, raw(content)
  end

  def nav_links
    {
      'Home' => root_path,
      'Resume' => resume_path,
      'Projects' => projects_path,
      'Experience' => tags_path,
      'Thoughts' => posts_path
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
