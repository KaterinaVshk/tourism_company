class CreateOders < ActiveRecord::Migration[6.0]
  def change
    create_table :oders do |t|
      t.integer :user_id
      t.integer :tour_id
      t.boolean :status, default: false
      t.date :date
      t.integer :persons
    end
  end
end
