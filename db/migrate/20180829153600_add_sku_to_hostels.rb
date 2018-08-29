class AddSkuToHostels < ActiveRecord::Migration[5.2]
  def change
    add_column :hostels, :sku, :string
  end
end
