class BookingsController < ApplicationController


  def show
    @user = current_user
    @comment = Comment.new
    @booking = Booking.find_by(:id => params[:id])
    respond_to do |format|
      format.html {render :show}
      format.json {render json: @booking}
    end
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
    @user = current_user
    @booking = Booking.find_by(:id => params[:id])
    respond_to do |format|
      format.html {render :edit}
      format.json {render json: @booking}
    end
  end

  def update
    @booking = Booking.find_by(:id => params[:id])
    @booking.update(booking_params)
    @booking.save
    redirect_to user_path(current_user)
  end

  def destroy
    @booking = Booking.find_by(:id => params[:id])
    #binding.pry
    current_user.bookings.delete(@booking)
    #binding.pry
    redirect_to user_path(current_user)
  end

  private

  def booking_params
    params.require(:booking).permit(:comment)
  end

end
