class CreateTestQuestions < ActiveRecord::Migration
  def change
    create_table :test_questions do |t|
      t.integer :online_test_id
      t.integer :question_id

      t.timestamps
    end
  end
end
