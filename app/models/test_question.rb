class TestQuestion < ActiveRecord::Base
  attr_accessible :question_id, :test_id
  belongs_to :question
  belongs_to :online_test
  has_many :candidate_answers,:dependent => :destroy

  def self.generate_test_questions(test)
      if(test.questions.count!=0)
        TestQuestion.delete_all(:online_test_id=>test.id)
      end
      tags=test.tag_list.split(",")
      questions=Question.tagged_with(tags,:any=>true)
      questions=questions.select('questions.*,RANDOM()').order("RANDOM()").limit(test.no_of_questions)
      test.questions=questions
  end

  def self.generate_candidate_questions(candidate_id,test_id)
    @questions=TestQuestion.select("test_questions.*,RANDOM()").where(:online_test_id=>test_id).order('RANDOM()')
    @questions.each do |q|
      CandidateAnswer.create(:candidate_id=>candidate_id,:test_question_id=>q.id)
    end
  end
end
