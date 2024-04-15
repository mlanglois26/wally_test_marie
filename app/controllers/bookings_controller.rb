class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  # def index
  #   @user = User.find(params[:id])
  #   @bookings = policy_scope(Booking)
  #   @bookings = Booking.where(user_id: @user)
  # end

  def show
    authorize @booking
    @flat = @booking.flat
  end

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    authorize @booking

    if @booking.save
      redirect_to dashboard_path, status: :see_other
    else
      render "pages/error", status: :unprocessable_entity
    end
  end

  def edit
    authorize @booking
  end

  def update
    authorize @booking
    @booking.update(booking_params)
    redirect_to dashboard_path, status: :see_other
  end

  def destroy
    authorize @booking
    @booking.destroy
    redirect_to dashboard_path, status: :see_other
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :price, :flat_id, :user_id)
  end

end
