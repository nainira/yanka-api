require 'test_helper'

class ShowingCarTest < ActionDispatch::IntegrationTest
  setup do
    Car.create!(id: 1,number: '58소8314')
    Car.create!(id: 2,number: '12허1234')
  end
  test "show car detail" do
    get '/cars/1', {}, { 'Accept' => 'application/json' }

    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type
  end
end
