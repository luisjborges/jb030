class AddColumnToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :note, :string
  end
end
