class User < ApplicationRecord
  has_secure_password
  has_many :bookings
  has_many :lessons, :through => :bookings

  validates :name, :presence => true
  validates :name, :uniqueness => {message: -> (object, data) do
    "Hey #{object.name}, #{data.value} has already been taken! Please try with another name."
  end }
  
  auto_strip_attributes :name

end
