class AddAddressToAdmins < ActiveRecord::Migration[5.2]
  def change
    add_column :admins, :address, :string
  end
end
