class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.string :firt_name
      t.string :last_name
      t.string :email
      t.string :street
      t.string :house_number
      t.string :city
      t.string :post_code
      t.string :country
      t.monetize :amount
      t.references :user, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
