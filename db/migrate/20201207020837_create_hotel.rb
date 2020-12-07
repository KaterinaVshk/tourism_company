class CreateHotel < ActiveRecord::Migration[6.0]
  def change
    create_table :hotels do |t|
      t.string :hotel
      t.string :stars  null: false, dafault: 0
      t.string :hotel_link
    end
  end
end
