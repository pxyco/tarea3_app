class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.integer :calories_earned
      t.integer :calories_lost
      t.string :text
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
