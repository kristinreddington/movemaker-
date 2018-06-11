class AddColumnTimeToLessons < ActiveRecord::Migration[5.2]
  def change
    add_column :lessons, :time, :string 
  end
end
