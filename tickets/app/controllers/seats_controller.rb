class SeatsController < ApplicationController
  
  def index
    n_rows = Seat.all.order(row: :desc).pluck('DISTINCT row')
    @seats_arr = []
    n_rows.each do |row_num|
      @seats_arr.push(Seat.all.order(:number).where(row: row_num).to_a)
    end

    if logged_in?
      print "\n\n"
      print current_user
      print "\n\n"
    end

  end

  def update
    # get input from form filled by admin and make changes to db
  end
end
