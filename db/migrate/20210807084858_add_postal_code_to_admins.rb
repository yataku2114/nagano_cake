class AddPostalCodeToAdmins < ActiveRecord::Migration[5.2]
  def change
    add_column :admins, :postal_code, :string
  end
end
