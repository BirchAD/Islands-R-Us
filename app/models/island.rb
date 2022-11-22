class Island < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :price, presence: true
  validates :location, presence: true
  has_many :bookings
  has_many_attached :photos
end
