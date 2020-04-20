class RemoveAdressFromPayments < ActiveRecord::Migration[6.0]
  def change
    remove_column :payments, :firt_name
    remove_column :payments, :last_name
    remove_column :payments, :email
    remove_column :payments, :street
    remove_column :payments, :city
    remove_column :payments, :post_code
    remove_column :payments, :house_number
    remove_column :payments, :country
  end
end
