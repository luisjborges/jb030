class RemovePhotoFromProducts < ActiveRecord::Migration[6.0]
  def change

    remove_column :products, :photo, :string
  end
end
