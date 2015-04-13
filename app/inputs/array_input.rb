class ArrayInput < SimpleForm::Inputs::StringInput
  def input(wrapper_options)
    input_html_options[:type] ||= input_type
    object.public_send(attribute_name).map.with_index do |value, index|
      array_input_field(value, index)
    end.push(add_additional_field_button).join.html_safe
  end

  def input_type
    :text
  end

  private

  def array_input_options(value, index = nil)
    input_html_classes.push 'form-control'
    index ||= (Time.now.to_f * 1000).to_i
    input_html_options.merge(
      id: (base_id + index.to_s),
      name: "#{ object_name }[#{ attribute_name }][]",
      value: value
    )
  end

  def array_input_field(value = '', index = nil)
    @builder.text_field(nil, array_input_options(value, index))
  end

  def add_additional_field_button
    fields = "$('[id^=\\'#{ base_id }\\']')"

    '<button href="#" class="btn btn-default" onclick="' +
    "#{ fields }.last().after(#{ fields }[0].outerHTML);" +
    "#{ fields }.last().val('');" +
    "#{ fields }.last().attr('id', '#{ base_id }' + Date.now());" +
    'return false;' +
    '">Add</button>'
  end

  def base_id
    "#{ object_name }_#{ attribute_name }_"
  end
end
