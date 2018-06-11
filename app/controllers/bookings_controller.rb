class BookingsController < ApplicationController


  def show
  end

  def create
    booking = Booking.new (
    :user_id => params[:lesson][:user_id]
  :lesson_id => params[:lesson][:lesson_id]
)
  redirect_to user_path(booking.user, :message => message)
  end

  def destroy
  end

end
