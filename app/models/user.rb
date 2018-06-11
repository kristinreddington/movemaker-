class User < ApplicationRecord
  has_secure_password
  has_many :bookings
  has_many :lessons, :through => :bookings

  validates :name, :presence => true
  #before_validation :strip_whitespace

  #def strip_whitespace
    #self.name.gsub!(/(\A\s*|\s*\z)/, '')
  #end
end
