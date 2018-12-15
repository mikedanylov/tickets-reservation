class AddUserToSeats < ActiveRecord::Migration[5.0]
  def change
    add_reference :seats, :user, index: true, foreign_key: true
  end
end
