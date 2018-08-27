class ChangeReference < ActiveRecord::Migration[5.2]
  def change
    remove_column :bookings, :users_id
    remove_column :bookings, :hostels_id
    add_reference :bookings, :user, index: true
    add_reference :bookings, :hostel, index: true
  end
end
