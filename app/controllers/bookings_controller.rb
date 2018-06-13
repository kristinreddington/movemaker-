class BookingsController < ApplicationController


  def create
      booking = Booking.new(
        :user_id => (params[:lesson][:user_id]),
        :lesson_id => (params[:lesson][:lesson_id])
      )
      if !booking.expired_lesson?
        booking.save
      end
    message = booking.book_lesson
   redirect_to user_path(booking.user, :message => message)

end

  def destroy
    @booking = Booking.find_by(:id => params[:id])
    current_user.bookings.delete(@booking)
    redirect_to user_path(current_user)
  end

end
