class CreateHotel < ActiveRecord::Migration[6.0]
  def change
    create_table :hotels do |t|
      t.string :hotel
      t.string :stars 
      t.string :hotel_link
    end
  end
end
