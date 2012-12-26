require 'test_helper'

class ResultsControllerTest < ActionController::TestCase
  setup do
    @result = results(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:results)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create result" do
    assert_difference('Result.count') do
      post :create, result: { candidate_id: @result.candidate_id, no_correct: @result.no_correct, no_incorrect: @result.no_incorrect, no_unanswered: @result.no_unanswered, rank: @result.rank, score: @result.score, test_id: @result.test_id }
    end

    assert_redirected_to result_path(assigns(:result))
  end

  test "should show result" do
    get :show, id: @result
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @result
    assert_response :success
  end

  test "should update result" do
    put :update, id: @result, result: { candidate_id: @result.candidate_id, no_correct: @result.no_correct, no_incorrect: @result.no_incorrect, no_unanswered: @result.no_unanswered, rank: @result.rank, score: @result.score, test_id: @result.test_id }
    assert_redirected_to result_path(assigns(:result))
  end

  test "should destroy result" do
    assert_difference('Result.count', -1) do
      delete :destroy, id: @result
    end

    assert_redirected_to results_path
  end
end
