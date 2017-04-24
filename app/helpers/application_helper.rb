module ApplicationHelper
  def format_datetime(datetime)
    l(datetime, format: :day_of_the_month) if datetime.present?
  end

  def format_date(date)
    date.strftime("%e/%m/%Y") if date.present?
  end

  def format_datetime_by_string(string_datetime)
    if string_datetime.present?
      DateTime.parse(string_datetime).strftime("%e/%m/%Y %H:%M:%S")
    else
      ""
    end
  end

  def format_hour(date)
    date.strftime("%H:%M") if date.present?
  end
end