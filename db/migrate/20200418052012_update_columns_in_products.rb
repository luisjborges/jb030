class UpdateColumnsInProducts < ActiveRecord::Migration[6.0]
  def change
    change_table :products do |t|
      t.change :size, :string
      t.change :delivery, :string
    end
  end
end
