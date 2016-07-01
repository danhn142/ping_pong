class AddPhoneAuthyColumns < ActiveRecord::Migration
  def change
    add_column :users, :verified, :boolean, :default => false
    add_column :users, :authy_id, :string
  end
end
