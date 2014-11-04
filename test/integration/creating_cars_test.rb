require 'test_helper'

class CreatingCarsTest < ActionDispatch::IntegrationTest
  setup do
    Car.create!(number: '58소8314')
  end
  test 'creates new cars with valid data' do
    post '/cars', { car: {
        number: '12가1888'
      } }.to_json,
      { 'Accept' => 'applicatoin/json',
        'Content-type' => 'application/json' }

    assert_equal 201, response.status
    assert_equal Mime::JSON, response.content_type
    car = json(response.body)
    assert_equal car_url(car[:id]), response.location
    assert_equal '12가1888', car[:number]
  end

  test 'does not create cars with invalid data' do
    post '/cars', { car: {
        number: nil
      } }.to_json,
      { 'Accept' => 'application/json',
        'Content-type' => 'application/json'}
    cars = Car.all
    assert_equal 422, response.status
    assert_equal 1, cars.size
  end

  test 'does not create cars with the same number' do
    post '/cars', { car: {
        number: '58소8314'
      } }.to_json,
      { 'Accept' => 'application/json',
        'Content-type' => 'application/json'}

    cars = Car.all
    assert_equal 1, cars.size
  end
end
