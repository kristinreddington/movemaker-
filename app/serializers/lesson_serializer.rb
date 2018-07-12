class LessonSerializer < ActiveModel::Serializer
  attributes :id, :name, :level, :time, :date, :genre
  has_many :bookings 
end
