module ApplicationHelper
  def bootstrap_class_for(flash_type)
    case flash_type
    when 'success'
      'alert-success'
    when 'error'
      'alert-danger'
    when 'alert'
      'alert-warning'
    when 'notice'
      'alert-info'
    else
      flash_type
    end
  end

  def destroy_button(object, html_options = {})
    html_options.merge!({
      method: :delete, class: 'btn btn-danger', name: 'Destroy', title: 'Destroy',
      data: { confirm: "Are you sure you want to destroy this #{ object.class.name }" }
    })
    link_to([:admin, object], html_options) { glyphicon_tag 'remove' }
  end

  def edit_button(object, html_options = {})
    html_options.merge!({ class: 'btn btn-primary', name: 'Edit', title: 'Edit' })
    link_to([:edit, :admin, object], html_options) { glyphicon_tag 'edit' }
  end

  def glyphicon_tag(name, content = nil)
    options = { class: "glyphicon glyphicon-#{ name }", aria: { hidden: true } }
    content ? content_tag(:span, content, options) : tag(:span, options)
  end

  def new_button(symbol, html_options = {})
    html_options.merge!({ class: 'btn btn-primary', name: 'New', title: 'New' })
    link_to([:new, :admin, symbol], html_options) { glyphicon_tag 'plus', 'New' }
  end

  def show_button(object, html_options = {})
    html_options.merge!({ class: 'btn btn-primary', name: 'Show', title: 'Show' })
    link_to([object], html_options) { glyphicon_tag 'eye-open' }
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
end
