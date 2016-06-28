class SetDefaultWinLoss < ActiveRecord::Migration
  def change
    change_column :users, :win, :integer, :default => 0, :null => false
    change_column :users, :loss, :integer, :default => 0, :null => false
  end
end
