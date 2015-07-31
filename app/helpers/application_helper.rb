module ApplicationHelper
  def flash_check(name)
    case name
    when "success"
      return "alert-success"
    when "warning"
      return "alert-warning"
    when "danger"
      return "alert-danger"
    else
      return "alert-info"
    end
  end
end
