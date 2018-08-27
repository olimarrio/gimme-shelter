class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.string :date
      t.integer :booking_number
      t.boolean :status, default: false
      t.references :users, foreign_key: true
      t.references :hostels, foreign_key: true

      t.timestamps
    end
  end
end
