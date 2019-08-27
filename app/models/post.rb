class Post < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :text, presence: true, length: { maximum: 140 }
  attr_accessor :date_from, :date_to
  paginates_per 10
  
  def self.total_grouped_by_day(start)
    calories = where(created_at: start.beginning_of_day..Time.zone.now)
    calories = calories.group("date(created_at)")
    calories = calories.select("created_at, sum(calories_earned) as total_calories_earned,
                                sum(calories_lost) as total_calories_lost")
    calories = calories.group_by { |c| c.created_at }
  end
    
end
