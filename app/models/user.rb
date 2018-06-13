class User < ApplicationRecord
  has_secure_password
  has_many :bookings
  has_many :lessons, :through => :bookings

  validates :name, :presence => true
  validates :email, :presence => true
  validates :email, :uniqueness => true

  auto_strip_attributes :name

  def self.find_or_create_by_omniauth(auth_hash)
    where(:email => auth_hash['info']['email']).first_or_create do |user|
      user.name = auth_hash['info']['name']
      user.password = SecureRandom.hex
    end
  end

end
