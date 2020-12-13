class AddAttributes2ToUsers< ActiveRecord::Migration[6.0]
  def change
    add_column :tours, :hotel, :string
    add_column :tours, :stars, :integer, null: false, default: 0
    add_column :tours, :country, :string
    add_column :tours, :city, :string
  end
end
