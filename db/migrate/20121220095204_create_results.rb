class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :online_test_id
      t.integer :candidate_id
      t.integer :no_correct
      t.integer :no_incorrect
      t.integer :no_unanswered
      t.float :score
      t.integer :rank

      t.timestamps
    end
  end
end
