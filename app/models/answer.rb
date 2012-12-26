class Answer < ActiveRecord::Base
  attr_accessible :answer, :is_correct, :question_id

  belongs_to :question
  has_many :candidate_answers
end
