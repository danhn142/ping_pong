class ChangeInSession < ActiveRecord::Migration
  def change
    remove_column :matches, :in_session
    add_reference :matches, :in_session, references: :users
  end
end
