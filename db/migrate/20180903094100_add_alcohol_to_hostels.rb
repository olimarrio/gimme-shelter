class AddAlcoholToHostels < ActiveRecord::Migration[5.2]
  def change
    add_column :hostels, :alcohol, :boolean, default: true
  end
end
