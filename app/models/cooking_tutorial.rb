class CookingTutorial < ApplicationRecord
  # Associations
  belongs_to :user
  has_many :users, through: :bookings
  has_many :bookings
  # Validations
  validates :title, :description, :location, :date, presence: true
end
