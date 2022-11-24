class Island < ApplicationRecord
  belongs_to :user
  # validates :name, presence: true
  # validates :price, presence: true
  # validates :location, presence: true
  has_many :bookings
  has_many_attached :photos

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
