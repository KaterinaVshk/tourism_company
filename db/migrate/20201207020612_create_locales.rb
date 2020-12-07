class CreateLocales < ActiveRecord::Migration[6.0]
  def change
    create_table :locales do |t|
      t.string :country
      t.string :country_link
      t.string :city
    end
  end
end
