class ChangeDateInLessons < ActiveRecord::Migration[5.2]
  def change
    change_column :lessons, :date, :date 
  end
end
