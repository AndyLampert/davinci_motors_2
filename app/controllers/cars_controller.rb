class CarsController < ApplicationController
  before_action :set_car

  def index
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    creation_message = "#{@car.year} #{@car.make} #{@car.model} created"
    if @car.save
      redirect_to :cars_path,
                  :notice => creation_message
    end
  end

  private
  def set_car
    @user = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit([:year, :make, :model, :price])
  end
end
