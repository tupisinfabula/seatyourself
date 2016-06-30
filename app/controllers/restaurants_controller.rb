class RestaurantsController < ApplicationController

  def index
    # show all restaurant and allow the user to make a manual reservation
    @restaurants = Restaurant.all
    @reservation = Reservation.new
  end

  def show
    restaurants = Restaurant.all
    restaurants = restaurants.where(["capacity >= ?", params[:people]]) if params[:people].present?
    restaurants = restaurants.where(["category LIKE ?", params[:category]]) if params[:category].present?
  end

  def new
    @restaurant = Restaurant.new
  end

  def create

    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_url(@restaurant)
    else
      render :new
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to restaurants_url
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.update_attributes(restaurant_params)
      redirect_to restaurant_url(@restaurant)
    else
      render :edit
    end
  end



  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :category, :price, :capacity, :address, :city)
  end

end
