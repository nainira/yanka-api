class CarsController < ApplicationController
  def index
    cars = Car.all
    if search = params[:search]
      cars = cars.where('number iLIKE ?', "%#{search}%")
    end
    render json: cars, status: 200
  end

  def show
    car = Car.find(params[:id])
    if car
      render json: car, status: 200
    else
      render json: [], status: 404
    end
  end
end
