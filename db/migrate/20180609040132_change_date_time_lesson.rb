class ChangeDateTimeLesson < ActiveRecord::Migration[5.2]
  def change
    remove_column :lessons, :time
    change_column :lessons, :date, :datetime
  end
end
