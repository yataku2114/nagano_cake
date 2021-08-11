class AddFirstNameKanaToAdmins < ActiveRecord::Migration[5.2]
  def change
    add_column :admins, :first_name_kana, :string
  end
end
