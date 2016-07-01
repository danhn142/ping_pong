class ChangeUser < ActiveRecord::Migration
  def change
    remove_column :users, :verified, :boolean, :default => false
    remove_column :users, :authy_id, :string
    add_column :users, :verification_code, :string
    add_column :users, :confirmed, :boolean, :default => false
  end
end
