class Candidate < ActiveRecord::Base
  attr_accessible :college, :department, :name, :roll_no, :year

  has_many :results
  has_many :candidate_answers
  validates :roll_no,:uniqueness=>{:message=>"This Prayudh ID was already used to enter the test!"}

  def teammates
    Candidate.where(:team_id=>self.id)
  end
end
