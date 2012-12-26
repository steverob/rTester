class RemoveColumnsFromOnlineTest < ActiveRecord::Migration
  def up
    remove_column("online_tests","no_wrong")
    remove_column("online_tests","no_unanswered")
  end

  def down
    add_column("online_tests","no_wrong",:integer)
    add_column("online_tests","no_unanswered",:integer)
  end
end
