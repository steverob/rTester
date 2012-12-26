class AddOpenToOnlineTest < ActiveRecord::Migration
  def change
    add_column("online_tests","open",:boolean)
  end
end
