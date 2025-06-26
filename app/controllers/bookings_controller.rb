class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = current_user.bookings.order(created_at: :desc)
  end

  def show
    authorize_booking!
  end

  def new
    @cooking_tutorial = CookingTutorial.find(params[:cooking_tutorial_id])
    @booking = Booking.new(cooking_tutorial: @cooking_tutorial)
  end

  def create
    @cooking_tutorial = CookingTutorial.find(params[:cooking_tutorial_id])
    @booking = current_user.bookings.build(booking_params)
    @booking.cooking_tutorial = @cooking_tutorial

    if @booking.save
      redirect_to @booking, notice: "Booking was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize_booking!
  end

  def update
    authorize_booking!
    if @booking.update(booking_params)
      redirect_to @booking, notice: "Booking was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize_booking!
    @booking.destroy
    redirect_to bookings_path, notice: "Booking was successfully cancelled."
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def authorize_booking!
    redirect_to bookings_path, alert: "Access denied." unless @booking.user == current_user
  end

  def booking_params
    params.require(:booking).permit(:confirmed)
  end
end
