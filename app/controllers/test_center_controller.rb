class TestCenterController < ApplicationController
  def instructions
    @test=OnlineTest.find(session[:test_id])
    @candidate=Candidate.find(session[:candidate_id])
  end
  def closed
    session[:candidate_id]=-1
    session[:test_id]=-1
  end
  def test
    @test=OnlineTest.find(session[:test_id])
    @candidate=Candidate.find(session[:candidate_id])

    @result=Result.where(:candidate_id=>@candidate.id,:online_test_id=>@test.id)[0]
    if @result.completed
      flash[:warning]="Please enter test from home!"
      redirect_to root_url
    else
      if @result.starttime.nil?
        @result.starttime=Time.now
        @result.save
      end

      if @test.timing==0
        @time=-1
      else
        @min=@test.timing-((Time.now-@result.starttime)/60).to_i
        @sec=((Time.now-@result.starttime)%60).to_i
        @time=1
        if @min > @test.timing || @min <= 0
          @time=0
        end
      end

      questions=CandidateAnswer.where(:candidate_id=>@candidate.id)
      @questions=Hash.new
      count=1
      questions.each do |q|
        question=q.test_question.question
        answers=question.answers
        @questions[count]=Array.new
        @questions[count] << q
        answers.each do |ans|
          @questions[count] << ans
        end
        count+=1
      end
      @q_array=@questions.keys.in_groups_of(5)
      @alpha=['Q','A','B','C','D']
    end


  end

  def wait
    @data=Hash.new
    @data["answer"]=params[:answer]
    render 'wait'
  end

  def evaluate
    @result=Result.where(:candidate_id=>session[:candidate_id],:online_test_id=>session[:test_id])[0]

    if !@result.completed
      answers=params[:answer]
      answers.each do |qn,ans|
        if ans!=-1
          a=CandidateAnswer.find(qn)
          a.answer_id=ans
          a.save
        end
      end
      @result.calculate_result(session[:test_id])
      redirect_to :action=>'finish',:candidate_id=>session[:candidate_id]
    else
      flash[:warning]="Please enter test from home!"
      redirect_to root_url
    end

  end

  def finish
        @test=OnlineTest.find(session[:test_id])
        @result=Result.where(:candidate_id=>session[:candidate_id],:online_test_id=>session[:test_id])[0]
  end
end
