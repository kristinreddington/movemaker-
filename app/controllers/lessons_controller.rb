class LessonsController < ApplicationController

  def index
    @lessons = Lesson.all
  end

  def show
    @lesson = Lesson.find_by_id(:id => params[:id])
    @user = current_user
  end

  def new
    if current_user.admin
      @lesson = Lesson.new
    else
      redirect_to user_path(current_user)
  end

  def create
    @lesson = Lesson.create(lesson_params)
    redirect_to lesson_path(@lesson)
  end

  def edit
  end

  def update
    lesson = Lesson.find_by_id(:id => params[:id])
    lesson.update(lesson_params)
    redirect_to lesson_path(lesson)
  end

  def destroy
  end

private

    def lesson_params
      params.require(:lesson).permit(
        :name,
        :genre,
        :level,
        :date,
        :time
      )
    end
end
