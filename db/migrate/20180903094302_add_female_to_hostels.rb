class AddFemaleToHostels < ActiveRecord::Migration[5.2]
  def change
    add_column :hostels, :female_only, :boolean, default: false
  end
end
