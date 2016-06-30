class ChangeColMatchesSession < ActiveRecord::Migration
  def change
    change_column :matches, :in_session, 'integer USING CAST(in_session AS integer)'
  end
end
