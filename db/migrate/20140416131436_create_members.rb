class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members, :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
      t.string :name # 真实姓名
      t.string :sex # 性别
      t.string :age # 年龄
      t.text :card_id # 身份证
      t.string :tel # 手机号
      t.string :address # 住址
      t.string :experience # 工作年限
      t.string :job # 应聘岗位

      t.timestamps
    end
  end
end
