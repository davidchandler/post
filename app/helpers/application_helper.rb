module ApplicationHelper

  def display_date(date)
      if logged_in?
        date = date.in_time_zone(current_user.time_zone)
      end
      date.strftime('%B %d, %Y at %I:%M %p %Z')
    end

end
