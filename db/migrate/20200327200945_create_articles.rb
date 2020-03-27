class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.integer :size
      t.integer :price
      t.string :name
      t.string :color
      t.string :fabric
      t.string :description
      t.integer :delivery
      t.string :image

      t.timestamps
    end
  end
end
