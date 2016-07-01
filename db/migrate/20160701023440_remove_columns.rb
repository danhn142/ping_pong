class RemoveColumns < ActiveRecord::Migration
  def change
    remove_column :users, :phone, :string
    remove_column :users, :country_code, :string
    remove_column :users, :verified, :boolean, default: false
    remove_column :users, :authy_id, :string
  end
end
