module ApplicationHelper
  def flash_message_class(level)
    case level
    when 'notice' then 'alert alert-info'
    when 'success' then 'alert alert-success'
    when 'error' then 'alert alert-danger'
    when 'alert' then 'alert alert-danger'
    end
  end

  def back_url(record)
    if record.persisted?
      [:admin, record]
    else
      [:admin, record.class.name.pluralize.downcase]
    end
  end
end
