module ApplicationHelper
  def readable_date(datetime)
    datetime.strftime("%b %d, %Y, at %I:%M%P")
  end
end
