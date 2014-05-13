class Job < ActiveRecord::Base
  validates :title, :presence => {:message => "请填写招聘职位"}, :length => {:maximum => 25, :message => "职位必须小于25个字"}
  validates :description, :presence => {:message => "请填写招聘信息"}
  scope :order_ct_desc, lambda { order("created_at DESC") }

  QUESTION_CATEGORYS = [["请选择", 0],["高管", 1], ["网络", 2], ["销售", 3], ["行政", 4], ["工程", 5]]

  def Job.question_category_name(category_id)
    QUESTION_CATEGORYS.each do |item|
      return item[0] if item[1] == category_id
    end
  end

  def question_category_name
    Job.question_category_name(self.question_category_id)
  end
end
