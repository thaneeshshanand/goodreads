module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = "Goodreads"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def error_message(object, field)
    if object.errors.nil?
      field.capitalize
    else
      "#{field.capitalize} #{object.errors.messages[field].first}"
    end
  end

end