
stat = ['available'] # add 'reserved' for sample data if needed
Seat.destroy_all
User.destroy_all

for row in 1..11
  case row
  when 1
    for seat in 1..17
      Seat.create!(row: row, number: seat, status: stat.sample, price: 10)
    end
  when 2, 3, 8, 9
    for seat in 1..18
      Seat.create!(row: row, number: seat, status: stat.sample, price: 10)
    end
  when 4, 5, 6, 7
    for seat in 1..14
      Seat.create!(row: row, number: seat, status: stat.sample, price: 10)
    end
  when 10, 11
    for seat in 1..9
      Seat.create!(row: row, number: seat, status: stat.sample, price: 10)
    end
  end
end

admin = User.create!(email: ENV["ADMIN_EMAIL"], password: ENV["ADMIN_PWD"], is_admin: true)
someguy = User.create!(email: 'some@example.com', password: '123qwe', is_admin: false)

Seat.all.each do |seat|
  seat.user = admin
  seat.save!
end
