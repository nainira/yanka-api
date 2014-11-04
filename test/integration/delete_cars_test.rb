require 'test_helper'

class DeleteCarsTest < ActionDispatch::IntegrationTest

  setup do
    @car = Car.create!(number: '12허1234')
    Car.create!(number: '22가2222')
  end
  test "delete cars" do
    cars = Car.all
    assert_equal 2, cars.size

    delete "/cars/#{@car.id}"
    assert_equal 204, response.status
    assert_equal 1, cars.size
  end
end
