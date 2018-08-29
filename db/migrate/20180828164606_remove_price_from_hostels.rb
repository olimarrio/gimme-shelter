class RemovePriceFromHostels < ActiveRecord::Migration[5.2]
  def change
    remove_column :hostels, :price
  end
end
