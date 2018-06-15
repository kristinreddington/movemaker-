require 'date'
class Lesson < ApplicationRecord
  has_many :bookings
  has_many :users, :through => :bookings

  def display_date
    display_day + " at" + display_time
  end

  def display_day
    self.date.strftime("%B%e,%Y")
  end

  def display_time
    self.time.strftime("%l:%M %P")
  end

  def expired_lesson?
    expired_days = Lesson.where('date < ?', DateTime.now)
    expired_times = Lesson.where('time < ?', Time.now)
    expired_days.include?(self) || expired_times.include?(self)
  end

  def self.non_expired_lessons

   Lesson.where('date > ?', Date.today).or(Lesson.where('date = ? AND time > ?', Date.today, Time.now))

  end

end
