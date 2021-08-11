class AddLastNameKanaToAdmins < ActiveRecord::Migration[5.2]
  def change
    add_column :admins, :last_name_kana, :string
  end
end
