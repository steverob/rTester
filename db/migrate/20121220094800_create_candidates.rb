class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.string :name
      t.string :college
      t.string :roll_no
      t.string :department
      t.integer :year

      t.timestamps
    end
  end
end
