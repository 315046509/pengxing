class AddPToCases < ActiveRecord::Migration
  def change
    add_column :cases, :question_category_id, :integer, :default => 0
  end
end
