class AddStartTimeToResults < ActiveRecord::Migration
  def change
    add_column("results","starttime",:datetime)
  end
end
