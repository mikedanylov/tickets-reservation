class AddUserToSeats < ActiveRecord::Migration
  def change
    add_reference :seats, :user, index: true, foreign_key: true
  end
end
