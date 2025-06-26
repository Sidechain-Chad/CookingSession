class Booking < ApplicationRecord
<<<<<<< HEAD
=======
  # Associations
  belongs_to :user
  belongs_to :cooking_tutorial
  # Validations
  validates :user_id, uniqueness: { scope: :cooking_tutorial_id, message: "has already booked this tutorial" }
  validates :confirmed, inclusion: { in: [true, false] }
>>>>>>> origin/foundation-code
end
