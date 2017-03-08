module ApplicationHelper
  def status_convertor(status, truthy: "Active", falsey: "Pending")
    if status
      truthy
    else
      falsey
    end
  end
  def time_ago time
    "#{time_ago_in_words(time)} ago"
  end

  def double_digit n
     sprintf '%02d' % n
   end
end
