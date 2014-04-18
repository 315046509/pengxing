class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :title
      t.text :description
      t.attachment :avatar
      t.timestamps
    end
  end
end
