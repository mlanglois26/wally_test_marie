class FlatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_flat, only: %i[show edit update destroy]

  def index
    @flats = Flat.all
  end

  def show
    authorize @flat
    @booking = Booking.new
  end

  def new
    @flat = Flat.new
    authorize @flat
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user = current_user
    authorize @flat
    if @flat.save
      redirect_to dashboard_path, status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @flat
  end

  def update
    authorize @flat
    if @flat.update(flat_params)
      redirect_to flat_path(@flat)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @flat
    @flat.destroy
    redirect_to flats_path, status: :see_other
  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:name, :price_per_night, :city, :rating, :address, :zip, :user_id)
  end
end
