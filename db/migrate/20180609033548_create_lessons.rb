class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.string :name
      t.string :genre
      t.string :level
      t.string :date
      t.string :time 
      t.timestamps
    end
  end
end
