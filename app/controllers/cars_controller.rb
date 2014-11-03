class CarsController < ApplicationController
  def index
    cars = Car.all
    if search = params[:search]
      cars = cars.where('number iLIKE ?', "%#{search}%")
    end
    render json: cars, status: 200
  end
end
