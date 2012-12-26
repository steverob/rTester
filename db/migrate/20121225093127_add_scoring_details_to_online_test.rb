class AddScoringDetailsToOnlineTest < ActiveRecord::Migration
  def change
    add_column("online_tests","correct_score",:float)
    add_column("online_tests","wrong_score",:float)
    add_column("online_tests","show_score",:boolean)
  end
end
