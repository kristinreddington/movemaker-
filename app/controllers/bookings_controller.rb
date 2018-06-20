class BookingsController < ApplicationController


  def show
    @booking = Booking.find_by(:id => params[:id])
    @user = current_user
  end

  def create
      booking = Booking.create(
        :user_id => (params[:lesson][:user_id]),
        :lesson_id => (params[:lesson][:lesson_id])
      )
    message = booking.book_lesson
   redirect_to user_path(booking.user, danger: message)

 end

  def edit
    @booking = Booking.find_by(:id => params[:id])
  end

  def update
    @booking = Booking.find_by(:id => params[:id])
    @booking.update(booking_params)
    @booking.save
    redirect_to user_path(current_user)
  end

  def destroy
    @booking = Booking.find_by(:id => params[:id])
    current_user.bookings.delete(@booking)
    redirect_to user_path(current_user)
  end

  private

  def booking_params
    params.require(:booking).permit(:comment)
  end

end
