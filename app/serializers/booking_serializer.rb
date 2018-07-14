class BookingSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :lesson_id, :notes
  belongs_to :lesson
  belongs_to :user
  has_many :notes
end
