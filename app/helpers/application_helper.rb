module ApplicationHelper
  def date_formatter date
    date.strftime("%e %B %Y, %R") if date.respond_to? :strftime
  end
end
