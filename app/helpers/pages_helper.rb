module PagesHelper
  def calories_char_data
    start_date = 1.month.ago
    calories_earned_by_day = current_user.posts.grouped_sumed_by_day(start_date)
    
    puts   calories_earned_by_day
    (start_date.to_date..Date.today).map do |date|
      {
          created_at: date,
          calories_earned: calories_earned_by_day[date].try(:[], :calories_earned) || 0,
          calories_lost: calories_earned_by_day[date].try(:[], :calories_lost) || 0,
      }
    end
  end
  
end
