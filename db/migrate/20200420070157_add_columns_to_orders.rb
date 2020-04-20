class AddColumnsToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :first_name, :string
    add_column :orders, :last_name, :string
    add_column :orders, :email, :string
    add_column :orders, :street, :string
    add_column :orders, :house_number, :string
    add_column :orders, :city, :string
    add_column :orders, :post_code, :string
    add_column :orders, :country, :string
  end
end
