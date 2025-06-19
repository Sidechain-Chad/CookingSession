class CookingTutorial < ApplicationRecord
  class CookingTutorial < ApplicationRecord
    # Associations
    belongs_to :user # host of the tutorial
    has_many :bookings, dependent: :destroy
    has_many :attendees, through: :bookings, source: :user

    # Validations
    validates :title, :description, :location, :date, presence: true
  end
end
