class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources, :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
      t.string :title, :null => false
      t.string :description, :null => false
      t.string :down, :null => false

      t.timestamps
    end
  end
end
