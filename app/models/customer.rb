class Customer < ActiveRecord::Base

  validates :description, :presence => {:message => "企业详细不能为空！"}

  attr_accessor :avatar
  has_attached_file :avatar, :styles => {:zhengchang => "150x51", :thumb => "68x48#", :huoban => "100x34#"}, :default_url => "/images/:style/missing.png",
                    :url => "/case/:id_partition/:style/:filename"
  validates_attachment_size :avatar, :less_than => 2.megabytes
  validates_attachment_content_type :avatar, :content_type => ['image/png', 'image/x-png', 'image/jpeg', 'image/pjpeg', 'image/jpg']

  scope :order_ct_desc, lambda { order("created_at DESC") }

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
  def Customer.message
    @message
  end
end
