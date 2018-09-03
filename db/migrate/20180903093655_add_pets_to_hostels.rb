class AddPetsToHostels < ActiveRecord::Migration[5.2]
  def change
    add_column :hostels, :pets, :boolean, default: false
  end
end
