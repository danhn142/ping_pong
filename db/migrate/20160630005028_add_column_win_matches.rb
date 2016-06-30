class AddColumnWinMatches < ActiveRecord::Migration
  def change
    add_column :matches, :in_session, :string 
  end
end
