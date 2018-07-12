class BookingSerializer < ActiveModel::Serializer
  attributes :id, :comment
  belongs_to :lesson
  belongs_to :user
  has_many :comments 
end
