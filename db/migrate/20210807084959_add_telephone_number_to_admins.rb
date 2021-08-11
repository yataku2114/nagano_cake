class AddTelephoneNumberToAdmins < ActiveRecord::Migration[5.2]
  def change
    add_column :admins, :telephone_number, :string
  end
end
