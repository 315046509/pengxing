class Member < ActiveRecord::Base
  scope :order_ct_desc, lambda { order("created_at DESC") }
  validates :name, :presence => {:message => "请填写您的姓名"}
  validates :sex, :presence => {:message => "请填写您的性别"}
  validates :age, :presence => {:message => "请填写您的年龄"}
  validates :card_id, :presence => {:message => "请填写身份证号码"}
  validates :tel, :presence => {:message => "请填写您的手机号码"}
  validates :address, :presence => {:message => "请填写您的家庭住址"}
  validates :experience, :presence => {:message => "请填写您的工作经验"}
  validates :job, :presence => {:message => "请填写您应聘的岗位"}
end
