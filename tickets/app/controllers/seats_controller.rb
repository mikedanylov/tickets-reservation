class SeatsController < ApplicationController
  def index
    @seats = Seat.all
  end
end
