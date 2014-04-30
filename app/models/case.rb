class Case < ActiveRecord::Base
  validates :title, :presence => {:message => "案例标题不能为空！"}, :length => {:maximum => 12, :message => "题目长度不能超过12"}
  validates :description, :presence => {:message => "案例内容不能为空！"}

  attr_accessor :avatar
  has_attached_file :avatar, :styles => {:zhengchang => "320x240", :thumb => "68x48#", :anli => "146x89#"}, :default_url => "/images/:style/missing.png",
                    :url => "/case/:id_partition/:style/:filename"
  validates_attachment_size :avatar, :less_than => 2.megabytes
  validates_attachment_content_type :avatar, :content_type => ['image/png', 'image/x-png', 'image/jpeg', 'image/pjpeg', 'image/jpg']

  scope :order_ct_desc, lambda { order("created_at DESC") }

  QUESTION_CATEGORYS = [["未分类", 0], ["档车杆", 1], ["龙嘉机场", 2], ["微信", 3]]

  def Case.question_category_name(category_id)
    QUESTION_CATEGORYS.each do |item|
      return item[0] if item[1] == category_id
    end
  end

  def question_category_name
    Case.question_category_name(self.question_category_id)
  end

  @filepath="public/roll/"
  @previewpath = "previews/"

  # 删除图片
  def self.deletefile(r_id)
    idstr = format("%09d", r_id.to_s)
    one_path = @filepath+idstr[0, 3]+"/"
    two_path = one_path + idstr[3, 3]+"/"
    three_path = two_path + idstr[6, 3]+"/"
    begin
      `rm -rf #{Rails.root+three_path}`
    rescue
      if system "rm -rf #{Rails.root+three_path}"
        return true
      else
        return false
      end
    end
    return true
  end

  #错误提示
  def Case.message
    @message
  end
end
