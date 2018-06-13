class BookingsController < ApplicationController


  def create
      booking = Booking.create(
        :user_id => (params[:lesson][:user_id]),
        :lesson_id => (params[:lesson][:lesson_id])
      )
    message = booking.book_lesson
   redirect_to user_path(booking.user, danger: message)

end

  def destroy
    @booking = Booking.find_by(:id => params[:id])
    current_user.bookings.delete(@booking)
    redirect_to user_path(current_user)
  end

end
