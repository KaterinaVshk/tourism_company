class FixColumnNameToTours < ActiveRecord::Migration[6.0]
  def change
    rename_column :tours, :type, :kind
  end
end
