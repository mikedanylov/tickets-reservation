class SeatsController < ApplicationController

  def index
    seat_rows = Seat.all.order(row: :desc).pluck('DISTINCT row')

    @seats = []
    seat_rows.each do |row_num|
      @seats.push(Seat.all.order(:number).where(row: row_num).to_a)
    end
  end

  # get input from form filled by admin and make changes to db
  def update
    json_obj = JSON.parse(params[:seats_to_update])
    json_obj.each do |obj|
      seat_to_update = Seat.find_by(row: obj['row'], number: obj['number'])
      seat_to_update.status = obj['status']
      seat_to_update.save!
    end
    flash.notice = "Seats status is updated!"
    redirect_to root_path
  end
end
