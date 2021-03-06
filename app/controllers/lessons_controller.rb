class LessonsController < ApplicationController

  def index
    @lessons = Lesson.non_expired_lessons
  end

  def expired
    @lessons = Lesson.expired_lessons
  end

  def info
    @lesson = Lesson.find(params[:id])
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @lesson }
    end
  end

  def show
    @lesson = Lesson.find_by(:id => params[:id])
    @user = current_user
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @lesson }
    end
  end

  def new
    if current_user.admin
      @lesson = Lesson.new
    else
      redirect_to user_path(current_user)
    end
  end

  def create
    @lesson = Lesson.create(lesson_params)
    redirect_to lesson_path(@lesson)
  end

  def edit
    find_lesson
  end

  def update
    find_lesson
    @lesson.update(lesson_params)
    redirect_to lesson_path(@lesson)
  end

  def destroy
    find_lesson
    @lesson.delete
    redirect_to lessons_path
  end

private

    def find_lesson
      @lesson = Lesson.find_by(:id => params[:id])
    end

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
