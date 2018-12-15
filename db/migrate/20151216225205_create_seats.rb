class CreateSeats < ActiveRecord::Migration[5.0]
  def change
    create_table :seats do |t|
      t.integer :number
      t.integer :row
      t.string :status
      t.float :price
      t.date :reserv_date

      t.timestamps null: false
    end
  end
end
