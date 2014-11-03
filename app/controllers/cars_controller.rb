class CarsController < ApplicationController
  def index
    cars = Car.all
    render json: cars, status: 200
  end
end
