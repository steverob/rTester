class Question < ActiveRecord::Base
  attr_accessible :question,:answers_attributes
  acts_as_taggable
  has_many :answers,:dependent => :destroy
  has_many :online_tests, :through=>:test_questions
  has_many :test_questions
  accepts_nested_attributes_for :answers, :reject_if => lambda { |a| a[:answer].blank? }


  def correct_answer
    Answer.where(:question_id=>self.id,:is_correct=>true)[0]
  end
end
