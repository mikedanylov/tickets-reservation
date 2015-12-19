class SeatsController < ApplicationController
  def index
    n_rows = Seat.all.order(row: :desc).pluck('DISTINCT row')
    @seats_arr = []
    n_rows.each do |row_num|
      @seats_arr.push(Seat.all.order(:number).where(row: row_num).to_a)
    end
  end

  def show
    # show same page as index but with additional javascript to change
    # status of a seat and a form to submit changes
  end

  def update
    # get input from form filled by admin and make changes to db
  end
end
