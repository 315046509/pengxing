class Job < ActiveRecord::Base
  validates :title, :presence => {:message => "请填写招聘职位"}, :length => {:maximum => 25, :message => "职位必须小于25个字"}
  validates :description, :presence => {:message => "请填写招聘信息"}
  scope :order_ct_desc, lambda { order("created_at DESC") }
end
