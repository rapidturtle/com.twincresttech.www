class ErrorHandlingFormBuilder < ActionView::Helpers::FormBuilder
  delegate :content_tag, :tag, to: :@template
  
  (field_helpers - %w(check_box radio_button hidden_field label)).each do |selector|
    src = <<-END_SRC
      def #{selector}(field, options = {})
        content_tag "p", label(field) + ": " + super
      end
    END_SRC
    class_eval src, __FILE__, __LINE__
  end
end
