class AddPriceToHostels < ActiveRecord::Migration[5.2]
  def change
    add_monetize :hostels, :price, currency: { present: false }

  end
end
