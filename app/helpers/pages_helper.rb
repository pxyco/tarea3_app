module PagesHelper
  def calories_char_data
    start_date = 1.month.ago
    calories_earned_by_day = current_user.posts.total_grouped_by_day(start_date)
    
      
    (start_date.to_date..Date.today).map do |date|
      {
          created_at: date,
          calories_earned: calories_earned_by_day[date].try(:first) && 
                            calories_earned_by_day[date].first.try(:total_calories_earned) || 0,
          calories_lost: calories_earned_by_day[date].try(:first) && 
                            calories_earned_by_day[date].first.try(:total_calories_lost) || 0
      }
    end
  end
end
