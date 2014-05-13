class AddOurToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :question_category_id, :integer, :default => 0
  end
end
