class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.integer :year
      t.string :result
      t.float :winningpercentage
      t.references :team, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
