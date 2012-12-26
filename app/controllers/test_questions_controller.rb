class TestQuestionsController < ApplicationController
  # GET /test_questions
  # GET /test_questions.json


  # DELETE /test_questions/1
  # DELETE /test_questions/1.json
  def destroy
    @test_question = TestQuestion.find(params[:id])
    @test_question.destroy

    respond_to do |format|
      format.html { redirect_to test_questions_url }
      format.json { head :no_content }
    end
  end
end
