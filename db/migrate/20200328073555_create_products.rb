class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :title
      t.string :description
      t.string :color
      t.integer :price
      t.integer :delivery
      t.string :fabric
      t.integer :size

      t.timestamps
    end
  end
end
