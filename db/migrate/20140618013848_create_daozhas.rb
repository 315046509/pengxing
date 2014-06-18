class CreateDaozhas < ActiveRecord::Migration
  def change
    create_table :daozhas do |t|
      t.string :name      #小区名称
      t.string :regional  #区域
      t.string :address   #所在地址
      t.string :number    #道闸数量
      t.string :access_conditions   #出入情况
      t.string :media_form    #媒体形式

      t.timestamps
    end
  end
end
