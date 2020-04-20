class RemoveAdressFromOrders < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :total
    remove_column :orders, :first_name
    remove_column :orders, :last_name
    remove_column :orders, :email
    remove_column :orders, :street
    remove_column :orders, :city
    remove_column :orders, :post_code
    remove_column :orders, :house_number
    remove_column :orders, :country
  end
end
