class CreateDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :deliveries do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :street
      t.string :house_number
      t.string :city
      t.string :post_code
      t.string :country
      t.references :user, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
