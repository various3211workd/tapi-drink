class AddUserNameToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :user_name, :string
  end
end
