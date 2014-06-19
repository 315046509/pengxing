class Daozha < ActiveRecord::Base
  validates :name, :presence => {:message => "请填写小区名称"}

  attr_accessor :avatar
  has_attached_file :avatar, :styles => {:index => "100x75#", :thumb => "68x48#",:show => "240x240#", :tuijian => "150x110#"}, :url => "/daozha/:id_partition/:style/:filename"
  validates_attachment_size :avatar, :less_than => 2.megabytes
  validates_attachment_content_type :avatar, :content_type => ['image/png', 'image/x-png', 'image/jpeg', 'image/pjpeg', 'image/jpg']

  scope :order_ct_desc, lambda { order("created_at DESC") }

  QUESTION_CATEGORYS = [["朝阳", 0], ["南关", 1], ["绿园", 2], ["宽城", 3],
                        ["二道", 4], ["双阳", 5], ["经开", 6], ["高新", 7],
                        ["汽车城", 8], ["净月", 9], ["长春周边", 10]]

  def Daozha.question_category_name(category_id)
    QUESTION_CATEGORYS.each do |item|
      return item[0] if item[1] == category_id
    end
  end

  def question_category_name
    Daozha.question_category_name(self.question_category_id)
  end

  @filepath="public/daozha/"
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
end
