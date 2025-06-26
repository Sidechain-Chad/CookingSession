
  class CookingTutorial < ApplicationRecord
    # Associations
    belongs_to :user # host of the tutorial
    has_many :bookings, dependent: :destroy
    has_many :users, through: :bookings
    # Validations
    validates :title, :description, :location, :date, presence: true
    
  end
