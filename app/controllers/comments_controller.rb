class CommentsController < ApplicationController

  def create
    comment = Comment.create(booking_params)
    redirect_to user_booking_path(current_user, comment.booking)
  end

  def destroy
    @comment = Comment.find_by(:id => params[:id])
    @comment.delete
    redirect_to user_booking_path(current_user, comment.booking)
  end

  private

  def booking_params
    params.require(:comment).permit(:user_id, :booking_id, :text)
  end
end
