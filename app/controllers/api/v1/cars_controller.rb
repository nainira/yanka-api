module Api
  module V1
    class CarsController < ApplicationController
      def index
        search = params[:search]
        if search.blank?
          raise ActionController::RoutingError.new("No route matches #{params[:unmatched_route]}")
        else
          cars = Car.all
          cars = cars.where('number iLIKE ?', "%#{search}%")
          render json: cars, status: 200
        end
      end

      def show
        car = Car.find(params[:id])
        respond_to do |format|
          format.json { render json: car, status: 200 }
          # format.html car
        end
        # if car
        #   render json: car, status: 200
        # else
        #   render json: [], status: 404
        # end
      end

      def create
        car = Car.new(car_params)
        if car.save
          render json: car, status: 201, location: car
        else
          render json: car.errors, status: 422
        end
      end

      def destroy
        car = Car.find(params[:id])
        car.destroy!
        render nothing: true, status: 204
      end

      private
        def car_params
          params.require(:car).permit(:number)
        end
    end
  end
end