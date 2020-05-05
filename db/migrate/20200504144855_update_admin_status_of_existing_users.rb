class UpdateAdminStatusOfExistingUsers < ActiveRecord::Migration[6.0]
  def up
  User.update_all({ :admin => false})
  end
  def down
  end
end
