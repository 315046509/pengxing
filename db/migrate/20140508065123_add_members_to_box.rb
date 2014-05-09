class AddMembersToBox < ActiveRecord::Migration
  def change
    add_column :members, :effective, :integer, :default => 0
  end
end
