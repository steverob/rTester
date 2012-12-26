class AddCompletedToResults < ActiveRecord::Migration
  def change
    add_column("results","completed",:boolean)
  end
end
