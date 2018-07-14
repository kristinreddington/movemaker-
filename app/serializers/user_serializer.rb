class UserSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :bookings
  has_many :notes, :through => :bookings 
end
