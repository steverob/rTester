require 'test_helper'

class CandidateAnswersControllerTest < ActionController::TestCase
  setup do
    @candidate_answer = candidate_answers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:candidate_answers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create candidate_answer" do
    assert_difference('CandidateAnswer.count') do
      post :create, candidate_answer: { answer_id: @candidate_answer.answer_id, candidate_id: @candidate_answer.candidate_id, test_question_id: @candidate_answer.test_question_id }
    end

    assert_redirected_to candidate_answer_path(assigns(:candidate_answer))
  end

  test "should show candidate_answer" do
    get :show, id: @candidate_answer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @candidate_answer
    assert_response :success
  end

  test "should update candidate_answer" do
    put :update, id: @candidate_answer, candidate_answer: { answer_id: @candidate_answer.answer_id, candidate_id: @candidate_answer.candidate_id, test_question_id: @candidate_answer.test_question_id }
    assert_redirected_to candidate_answer_path(assigns(:candidate_answer))
  end

  test "should destroy candidate_answer" do
    assert_difference('CandidateAnswer.count', -1) do
      delete :destroy, id: @candidate_answer
    end

    assert_redirected_to candidate_answers_path
  end
end
