class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /bookings
  def index
    @bookings = current_user.bookings.order(created_at: :desc)
  end

  # GET /bookings/:id
  def show
    authorize_booking!
  end

  # GET /bookings/new
  def new
    @cooking_class = CookingClass.find(params[:cooking_class_id])
    @booking = Booking.new(cooking_class: @cooking_class)
  end

  # POST /bookings
  def create
    @booking = current_user.bookings.build(booking_params)
    if @booking.save
      redirect_to @booking, notice: 'Booking was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /bookings/:id/edit
  def edit
    authorize_booking!
  end

  # PATCH/PUT /bookings/:id
  def update
    authorize_booking!
    if @booking.update(booking_params)
      redirect_to @booking, notice: 'Booking was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /bookings/:id
  def destroy
    authorize_booking!
    @booking.destroy
    redirect_to bookings_path, notice: 'Booking was successfully cancelled.'
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def authorize_booking!
    redirect_to bookings_path, alert: 'Access denied.' unless @booking.user == current_user
  end

  def booking_params
    params.require(:booking).permit(:cooking_class_id, :scheduled_at, :dietary_restrictions, :status)
  end
end
