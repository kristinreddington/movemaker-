class ChangeTimeColumnLessons < ActiveRecord::Migration[5.2]
  def change
    change_column :lessons, :time, :time 
  end
end
