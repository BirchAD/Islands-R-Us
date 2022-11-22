class Island < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
  validates :location, presence: true
  # validates :photo, presence: true
  # belongs_to :user
end
