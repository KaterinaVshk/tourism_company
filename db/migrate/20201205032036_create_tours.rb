class CreateTours < ActiveRecord::Migration[6.0]
  def change
    create_table :tours do |t|
      t.string :name, null: false
      t.string :type, null: false
      t.integer :nights, null: false, default: 0
      t.string :food, null: false, default: 'Без питнания'
      t.string :transport, null: false
      t.integer :price, null: false, default: 0
      t.string :description
      t.timestamps
    end
  end
end
