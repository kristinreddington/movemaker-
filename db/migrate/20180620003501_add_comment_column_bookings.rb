class AddCommentColumnBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :comment, :text
  end
end
