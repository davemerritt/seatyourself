class ReservationsController < ApplicationController
  before_filter :load_restaurant

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = @restaurant.reservations.build(reservation_params)
    @reservation.user_id = current_user.id
  
    if @reservation.save
      redirect_to :root
    else
      render restaurants_path
    end
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.update_attributes(reservation_params)
      redirect_to reservation_path(@reservation)
    else
      render :edit
    end
  end

  def show

  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to reservations_path
  end

  private
  def reservation_params
    params.require(:reservation).permit(:user_id, :time_slot, :guests, :restaurant_id)
  end

  def load_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
