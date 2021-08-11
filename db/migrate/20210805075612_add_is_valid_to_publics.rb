class AddIsValidToPublics < ActiveRecord::Migration[5.2]
  def change
    add_column :publics, :is_valid, :boolean, default: true, null: false
  end
end
