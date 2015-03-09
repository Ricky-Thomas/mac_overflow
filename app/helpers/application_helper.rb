module ApplicationHelper

  def edited_time(item)
    if Time.now - item.updated_at < 60
      (Time.now.utc - item.updated_at).round(0).to_s + " seconds ago"
    elsif Time.now - item.updated_at > 60 && Time.now - item.updated_at < 3600
      ((Time.now.utc - item.updated_at).round(0)/60).to_s + " minutes ago"
    # minutes
    elsif Time.now.utc - item.updated_at > 3600 && Time.now - item.updated_at < 86400
      ((Time.now.utc - item.updated_at).round(0)/60/60).to_s + " hours ago"
    # hours
    else # days
      ((Time.now.utc - item.updated_at).round(0)/60/60/24).to_s + " days ago"
    end
  end


  def answered_time(item)
    if Time.now - item.created_at < 60
      (Time.now.utc - item.created_at).round(0).to_s + " seconds ago"
    elsif Time.now - item.created_at > 60 && Time.now - item.created_at < 3600
      ((Time.now.utc - item.created_at).round(0)/60).to_s + " minutes ago"
    # minutes
    elsif Time.now.utc - item.created_at > 3600 && Time.now - item.created_at < 86400
      ((Time.now.utc - item.created_at).round(0)/60/60).to_s + " hours ago"
    # hours
    else # days
      ((Time.now.utc - item.created_at).round(0)/60/60/24).to_s + " days ago"
    end
  end
end
