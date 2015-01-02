class CarsController < ApplicationController
  def new
    @car = Car.new
  end

  def index
    @cars = Car.all
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      redirect_to cars_path, notice: "Car Saved Successfully!"
    else
      render :new
    end
  end

  private

  def car_params
    params.require(:car).permit(
      :manufacturer_id,
      :color,
      :year,
      :mileage,
      :description
    )
  end
end
