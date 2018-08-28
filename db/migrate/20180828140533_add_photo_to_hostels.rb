class AddPhotoToHostels < ActiveRecord::Migration[5.2]
  def change
    add_column :hostels, :photo, :string
  end
end
