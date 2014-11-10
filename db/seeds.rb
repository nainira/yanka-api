# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

hangle_array = ['가','나','다','가','라','바','사','아','자']
100.times do |n|
  number = Random.rand(10..99).to_s + hangle_array[Random.rand(0..8)] +Random.rand(1000..9999).to_s
  car = Car.create!(number: number)
  10.times do |num|
    car = Car.find(n+1)
    content = Faker::Lorem.sentence(2, true, 1)
    car.comments.create!(content: content)
  end
end

