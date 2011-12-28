module ApplicationHelper
  def error_handling_form_for(object, options = {}, &block)
    options[:builder] = ErrorHandlingFormBuilder
  end
end
