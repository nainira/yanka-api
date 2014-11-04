require 'test_helper'

class ListingCarsTest < ActionDispatch::IntegrationTest
  setup do
    Car.create!(number: '58소8314')
    Car.create!(number: '12허1234')
  end
  test 'listing cars' do
    get '/cars', {} , { 'Accept' => 'application/json' }

    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type

    assert_equal Car.count, json(response.body)[:cars].size
  end

  test 'searching cars with number' do
    get '/cars?search=58', {} , { 'Accept' => 'application/json' }

    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type
    cars = json(response.body)
    assert_equal 1, json(response.body).size

  end
end
