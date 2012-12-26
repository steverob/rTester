class CandidateAnswer < ActiveRecord::Base
  attr_accessible :answer_id, :candidate_id, :test_question_id
  belongs_to :test_question
  belongs_to :candidate
  belongs_to :answer
end
