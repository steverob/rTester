class RemoveDateFromAndToFromONlineTest < ActiveRecord::Migration
  def up
    remove_column("online_tests","date_from")
    remove_column("online_tests","date_to")
  end

  def down
    add_column("online_tests","date_from",:datetime)
    add_column("online_tests","date_to",:datetime)
  end
end
