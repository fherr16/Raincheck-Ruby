class RestaurantsController < ApplicationController
  def find
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if !Restaurant.exists?(name: @restaurant.name, street: @restaurant.street, postal: @restaurant.postal)
      if @restaurant.save
        session[:currentRestaurantId] = @restaurant.id
        redirect_to add_path
      else
        redirect_to restaurants_path
      end
    else
      @restaurantTwo = Restaurant.find_by(name: @restaurant.name, street: @restaurant.street, postal: @restaurant.postal)
      session[:currentRestaurantId] = @restaurantTwo.id
      redirect_to add_path
    end
  end
  
  def view
    @restaurant = Restaurant.all
  end
    
  private
    def restaurant_params
      params.require(:restaurant).permit(:name,:street,:route,:local,:admin,:country,:postal)
    end
end
