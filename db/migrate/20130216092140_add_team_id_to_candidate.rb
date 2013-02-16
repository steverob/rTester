class AddTeamIdToCandidate < ActiveRecord::Migration
  def change
    add_column("candidates","team_id",:integer)
  end
end
