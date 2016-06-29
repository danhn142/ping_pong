class ChangeMatchesTypeCol < ActiveRecord::Migration
  def change
    rename_column :matches, :type, :match_type
  end
end
