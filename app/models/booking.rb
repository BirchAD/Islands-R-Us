class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :island
  validates :user_id, presence: true
  validates :island_id, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :price_per_night, presence: true
  validates :total_price, presence: true
end
