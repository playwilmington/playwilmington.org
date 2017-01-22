class FormBuilder < ActionView::Helpers::FormBuilder
  delegate :content_tag, :tag, to: :@template
  delegate :errors, to: :@object

  FIELDTYPES = %w(text_field email_field number_field password_field url_field
                  phone_field date_field).freeze

  FIELDTYPES.each do |method_name|
    define_method(method_name) do |name, options = {}|
      label_options = {}
      icon = options.delete(:icon)
      label_options[:text] = options.delete(:label)
      outer_class = options.delete(:outer_class)
      help = options.delete(:help_text)
      row_class =
        if outer_class
          'row ' + outer_class
        else
          'row'
        end

      content_tag :div, class: row_class do
        content_tag :div, class: 'input-field col s12' do
          if icon && help
            text_field_icon(icon) + super(name, options) +
              text_field_label(name, label_options) + help_text(help)
          elsif icon && !help
            text_field_icon(icon) + super(name, options) +
              text_field_label(name, label_options)
          elsif !icon && help
            super(name, options) + text_field_label(name, label_options) +
              help_text(help)
          else
            super(name, options) + text_field_label(name, label_options)
          end
        end
      end
    end
  end

  def text_area(method, options = {})
    label_options = {}
    icon = options.delete(:icon)
    label_options[:text] = options.delete(:label)
    options[:class] ||= ''
    options[:class] += ' materialize-textarea'

    content_tag :div, class: 'row' do
      content_tag :div, class: 'input-field col s12' do
        if icon
          text_field_icon(icon) + super(method, options) +
            text_field_label(method, label_options)
        else
          super(method, options) + text_field_label(method, label_options)
        end
      end
    end
  end

  def file_field(method, options = {})
    btn_name = options.delete(:label)
    placeholder = options.delete(:placeholder)

    content_tag :div, class: 'row' do
      content_tag :div, class: 'file-field input-field col s12' do
        content_tag(:div, class: 'btn') do
          content_tag(:span) { btn_name } + super(method, options)
        end +
          content_tag(:div, class: 'file-path-wrapper') do
            content_tag(:input, nil, type: 'text', class: 'file-path',
                                     placeholder: placeholder)
          end
      end
    end
  end

  def check_box(method, options = {}, checked_val = '1', unchecked_val = '0')
    label_options = {}
    label_options[:text] = options.delete(:label)
    outer_class = options.delete(:outer_class)
    row_class =
      if outer_class
        'row ' + outer_class
      else
        'row'
      end

    content_tag :div, class: row_class do
      content_tag :div, class: 'col s12' do
        content_tag :p do
          super(method, options, checked_val, unchecked_val) +
            text_field_label(method, label_options)
        end
      end
    end
  end

  def select(method, choices = nil, options = {}, html_options = {})
    label_options = {}
    label_options[:text] = options.delete(:label)
    outer_class = options.delete(:outer_class)
    row_class =
      if outer_class
        'row ' + outer_class
      else
        'row'
      end

    content_tag :div, class: row_class do
      content_tag(:div, class: 'input-field col s12') do
        super(method, choices, options, html_options) +
          text_field_label(method, label_options)
      end
    end
  end

  def submit(value = nil, options = {})
    options[:class] ||= ''
    options[:class] += ' btn waves-effect waves-light'

    content_tag :div, class: 'section' do
      content_tag(:div, class: 'input-field') do
        super(value, options)
      end
    end
  end

  private

  def text_field_label(name, label_options)
    label(name, label_options[:text])
  end

  def text_field_icon(icon)
    content_tag(:i, class: 'material-icons prefix') { icon.to_s }
  end

  def help_text(text)
    content_tag(:small, class: 'help-text') { text.to_s }
  end
end
