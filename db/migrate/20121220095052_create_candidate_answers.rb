class CreateCandidateAnswers < ActiveRecord::Migration
  def change
    create_table :candidate_answers do |t|
      t.integer :test_question_id
      t.integer :answer_id
      t.integer :candidate_id

      t.timestamps
    end
  end
end
