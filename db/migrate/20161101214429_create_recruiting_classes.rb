class CreateRecruitingClasses < ActiveRecord::Migration
  def change
    create_table :recruiting_classes do |t|
      t.integer :year
      t.integer :rank
      t.integer :five_stars
      t.integer :four_stars
      t.integer :three_stars
      t.references :team, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
