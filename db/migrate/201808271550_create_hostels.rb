class CreateHostels < ActiveRecord::Migration[5.2]
  def change
    create_table :hostels do |t|
      t.string :name
      t.string :address
      t.text :description
      t.integer :price

      t.timestamps
    end
  end
end
