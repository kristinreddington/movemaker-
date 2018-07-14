class NotesController < ApplicationController

  def index
    set_booking
    @notes = @booking.notes
    render :json => @notes

  end

  def create
    set_booking
    @note = @booking.notes.build(note_params)
    if @note.save
      respond_to do |format|
        format.html { render :show }
        format.json { render json: @note }
      end
    end
  end

  def destroy
    @note = Note.find_by(:id => params[:id])
    @note.delete
    redirect_to user_booking_path(current_user, comment.booking)
  end

  private

  def set_booking
    @booking = Booking.find(params[:booking_id])
  end

  def note_params
    params.require(:note).permit(:user_id, :booking_id, :text)
  end
end
