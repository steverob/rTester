class Candidate < ActiveRecord::Base
  attr_accessible :college, :department, :name, :roll_no, :year

  has_many :results
  has_many :candidate_answers
end
