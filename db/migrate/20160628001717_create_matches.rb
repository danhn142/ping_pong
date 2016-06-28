class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.references :user, index: true
      t.references :opponent, index: true
      t.string :status
      t.string :type

      t.timestamps
    end
  end
end
