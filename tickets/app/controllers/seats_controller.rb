class SeatsController < ApplicationController
  
  def index
    n_rows = Seat.all.order(row: :desc).pluck('DISTINCT row')
    @seats_arr = []
    n_rows.each do |row_num|
      @seats_arr.push(Seat.all.order(:number).where(row: row_num).to_a)
    end
  end

  def update
    print "\n\n"
    json_obj = JSON.parse(params[:seats_to_update])
    print json_obj
    print "\n\n"
    # get input from form filled by admin and make changes to db
    flash.notice = "Seats status is updated!"
    redirect_to root_path
  end
end
