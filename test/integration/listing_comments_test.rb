require 'test_helper'

class ListingCommentsTest < ActionDispatch::IntegrationTest

  setup do
    car = Car.create!(id: 1,number: '58소8314')
    another_car =Car.create!(id: 2,number: '12허1234')
    car.comments.create(content: 'texttext')
    another_car.comments.create(content: 'texttext')
  end
  test 'listing comments' do
    get '/cars/1/comments', {} , { 'Accept' => 'application/json' }

    assert 200, response.status
    assert_equal Mime::JSON, response.content_type

    assert_equal Comments.count, json(response.body)[:comments].size
  end
end
