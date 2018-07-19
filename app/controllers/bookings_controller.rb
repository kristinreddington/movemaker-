class BookingsController < ApplicationController
skip_before_action :verify_authenticity_token, only: :destroy

  def show
    @user = current_user
    @booking = Booking.find_by(:id => params[:id])
    respond_to do |format|
      format.html {render :show}
      format.json {render :json => @booking}
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
    @note = Note.new
    @notes = @booking.notes
    respond_to do |format|
      format.html {render :edit}
      format.json {render json: @booking}
    end
  end

  def update
    @booking = Booking.find_by(:id => params[:id])
    @booking.save
    redirect_to user_path(current_user)
  end

  def destroy
    @user = User.find(params[:user_id])
    @booking = Booking.find(params[:id])
    title = @booking.lesson.name
    if @booking.destroy
      redirect_to user_path(current_user), :success => "Booking cancelled successfully."
      @user.save

  else
    flash[:error] = "There was an error cancelling your booking."
    render :edit
    end
  end

end
