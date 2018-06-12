class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :lesson

  def expired_lesson?
    expired_days = Lesson.where('date < ?', DateTime.now)
    expired_times = Lesson.where('time < ?', Time.now)
    expired_days.include?(self.lesson) || expired_times.include?(self.lesson)
  end

  def book_lesson
    if expired_lesson?
      "Sorry, this lesson has expired."
    else
      "Thanks for signing up for #{self.lesson.name}"
    end
  end

end
