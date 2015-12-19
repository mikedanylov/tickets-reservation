# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

stat = ['available', 'reserved']
Seat.destroy_all
User.destroy_all

for row in 1..10
  for seat in 1..15
    Seat.create!(row: row, number: seat, status: stat.sample, price: 10, reserv_date: Date.today)
  end
end

admin = User.create!(email: 'some@email.com', password: 'qwe123', is_admin: true)
someguy = User.create!(email: 'some@example.com', password: '123qwe', is_admin: false)

Seat.all.each do |seat|
  seat.user = admin
  seat.save!
end
