module ApplicationHelper
  def experience(years)
    case years
    when 0
      'less than 1 year'
    when 1
       '1 year'
      else
        "#{years} years"
    end
  end
end
