class OnlineTest < ActiveRecord::Base
  attr_accessible :name, :created_by, :negative_marking, :timing, :tag_list, :no_of_questions,:correct_score, :wrong_score, :show_score

  has_many :questions, :through=>:test_questions
  has_many :results
  has_many :test_questions
  before_destroy :clear_associations

  def self.all_open
    OnlineTest.where(:open=>true)
  end

  private

  def clear_associations
    test_qns=TestQuestion.where(:online_test_id=>self.id)
    test_qns.each do |qn|
      qn.candidate_answers.each do |ans|
        ans.destroy
      end
      qn.destroy
    end
    Result.delete_all(:online_test_id=>self.id)
  end

end
