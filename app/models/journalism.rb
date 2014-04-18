class Journalism < ActiveRecord::Base

  validates :title, :presence => {:message => "请填写标题"}, :length => {:maximum => 25, :message => "标题必须小于25个字"}
  validates :descrpiton, :presence => {:message => "请填写内容"}

  scope :order_ct_desc, lambda { order("created_at DESC") }

  QUESTION_CATEGORYS = [["新闻动态", 1], ["公司告示", 2]]

  def Journalism.question_category_name(category_id)
    QUESTION_CATEGORYS.each do |item|
      return item[0] if item[1] == category_id
    end
  end

  def question_category_name
    Journalism.question_category_name(self.question_category_id)
  end

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
end
