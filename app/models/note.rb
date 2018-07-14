class Note < ApplicationRecord
  belongs_to :booking
  belongs_to :user

  validates :text, :presence => true
end
