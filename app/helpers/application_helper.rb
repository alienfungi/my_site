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
    link_to([object], html_options) { glyphicon_tag 'remove' }
  end

  def edit_button(object, html_options = {})
    html_options.merge!({ class: 'btn btn-primary', name: 'Edit', title: 'Edit' })
    link_to([:edit, object], html_options) { glyphicon_tag 'edit' }
  end

  def glyphicon_tag(name)
    tag(:span, class: "glyphicon glyphicon-#{ name }", aria: { hidden: true })
  end

  def new_button(object, html_options = {})
    html_options.merge!({ class: 'btn btn-primary', name: 'New', title: 'New' })
    link_to([object], html_options) { glyphicon_tag 'add' }
  end

  def show_button(object, html_options = {})
    html_options.merge!({ class: 'btn btn-primary', name: 'Show', title: 'Show' })
    link_to([object], html_options) { glyphicon_tag 'eye-open' }
  end
end
