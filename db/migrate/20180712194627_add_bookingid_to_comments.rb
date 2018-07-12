class AddBookingidToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :booking_id, :integer
  end
end
