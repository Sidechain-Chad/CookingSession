class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
<<<<<<< HEAD
=======

  # Associations
  has_many :cooking_tutorials, dependent: :destroy # tutorials the user hosts
  has_many :bookings, dependent: :destroy # bookings the user has made
>>>>>>> origin/foundation-code
end
