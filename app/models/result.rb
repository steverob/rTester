class Result < ActiveRecord::Base
  attr_accessible :candidate_id, :no_correct, :no_incorrect, :no_unanswered, :rank, :score, :online_test_id,:completed
  belongs_to :online_test
  belongs_to :candidate

  def self.generate_result(candidate,test)
    Result.create(:online_test_id=>test,:candidate_id=>candidate,:no_unanswered=>OnlineTest.find(test).no_of_questions,:no_correct=>0,:no_incorrect=>0,:score=>0.0,:rank=>0,:completed=>false)
  end


  def calculate_result(test_id)
     answers=CandidateAnswer.where(:candidate_id=>self.candidate_id)
     test=OnlineTest.find(test_id)
     correct=0
     incorrect=0
     unanswered=0
     score=0.0
     c_score=test.correct_score
     w_score=test.wrong_score
     #negative_marking=test.negative_marking
     answers.each do |ans|
      if ans.answer_id==-1
        unanswered+=1
      elsif ans.answer_id==ans.test_question.question.correct_answer.id
        correct+=1
        score+=c_score
      else
        incorrect+=1
        score-=w_score
      end
     end
     self.no_correct=correct
     self.no_incorrect=incorrect
     self.no_unanswered=unanswered
     self.score=score
     self.completed=true
     self.save
  end

  def self.calculate_rank(test_id)
     results=Result.where(:online_test_id=>test_id).order('score desc')
     a=results[0].score+1
      if(results.count()!=0)
        rank=1
        count=0
        prev_score=results[0].score
        results.each do |result|
          count+=1
          if(result.score==prev_score)
            result.rank=rank
          else
            result.rank=count
            rank=count
          end
          prev_score=result.score
          result.save
        end
      end
  end

end
