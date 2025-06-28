class AddCookingTutorialToBookings < ActiveRecord::Migration[7.1]
  def change
    add_reference :bookings, :cooking_tutorial, null: false, foreign_key: true
  end
end
