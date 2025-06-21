class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_booking, only: [:show, :edit, :update]

  # Bookings I'm attending and bookings for my tutorials
  def index
    @my_bookings = current_user.bookings.includes(:cooking_tutorial)

    @hosted_bookings = Booking.joins(:cooking_tutorial)
                               .where(cooking_tutorials: { user_id: current_user.id })
                               .includes(:user, :cooking_tutorial)
  end

  # See details of one booking (e.g. dietary requirements)
  def show
  end

  # Booking form for a tutorial
  def new
    @cooking_tutorial = CookingTutorial.find(params[:cooking_tutorial_id])
    @booking = Booking.new
  end

  # Submit a new booking
  def create
    @cooking_tutorial = CookingTutorial.find(params[:cooking_tutorial_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.cooking_tutorial = @cooking_tutorial

    if @booking.save
      redirect_to bookings_path, notice: "Booking created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # Edit a booking (e.g. confirm or update dietary info)
  def edit
  end

  # Update a booking
  def update
    if @booking.update(booking_params)
      redirect_to bookings_path, notice: "Booking updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:confirmed)
  end
end
