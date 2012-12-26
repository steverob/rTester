class CreateOnlineTests < ActiveRecord::Migration
  def change
    create_table :online_tests do |t|
      t.string :name
      t.datetime :date_from
      t.datetime :date_to
      t.integer :timing
      t.integer :no_of_questions
      t.integer :no_wrong
      t.integer :no_wrong
      t.integer :no_unanswered
      t.boolean :negative_marking
      t.string :tag_list
      t.string :created_by
      t.timestamps
    end
  end
end
