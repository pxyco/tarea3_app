class ChangeCaloriesDefaultValues < ActiveRecord::Migration[5.1]
  def change
    change_column_default :posts, :calories_earned, 0
    change_column_default :posts, :calories_lost, 0
  end
end
