class Resource < ActiveRecord::Base

  scope :order_ct_desc, lambda { order("created_at DESC") }

  validates :title, :presence => {:message => "名称不能为空"}, :length => {:maximum => 20, :message => "名称长度必须小于20"}
  validates :description, :presence => {:message => "简介不能为空"}, :length => {:maximum => 200, :message => "名称长度必须小于200"}
  validates :down, :presence => {:message => "请上传文件"}

  @filepath="public/upload/"
  @downpath = "downs/"

  def Resource.upload(id, file)
    @message = ''
    if validate
      dir_path = self.get_dir(@filepath, @downpath, id)
      if dir_path
        file_name = getname dir_path, file.original_filename
        begin
          File.open("#{Rails.root.to_s}/#{dir_path+file_name}", "wb") do |f|
            f.write(file.read)
          end
        rescue
          @message="上传文件失败"
          return nil
        end
        return file_name
      else
        @message="创建目录失败"
        return nil
      end
    else
      @message="格式不对"
      return nil
    end
  end

  def self.getdir_by_id(upload, id)
    idstr = format("%09d", id.to_s)
    one_path = upload+idstr[0, 3]+"/"
    two_path = one_path + idstr[3, 3]+"/"
    three_path = two_path + idstr[6, 3]+"/"
  end

  def self.get_dir(filepath, preordown_path, id)
    idstr = format("%09d", id.to_s)
    dir_path = filepath+idstr[0, 3]+"/" + idstr[3, 3]+"/" + idstr[6, 3]+"/" +preordown_path
    begin
      `mkdir -p #{Rails.root+dir_path}`
    rescue
      if system "mkdir -p #{Rails.root+dir_path}"
        return dir_path
      else
        return nil
      end
    end
    return dir_path
  end

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

  def Resource.getname(img_path, img_file)
    img_for = img_file[img_file.length-4, 4]
    filename = Time.now.strftime("%Y%m%d%h%m%s")<<rand(99999).to_s<<img_for
    file = img_path+filename
    while File.exist?(file) do
      filename = Time.now.strftime("%Y%m%d%h%m%s")<<rand(99999).to_s<<img_for
      file = img_path+filename
    end
    filename
  end

  #错误提示
  def Resource.message
    @message
  end

  def Resource.resetimagename
    Resource.all.each do |r|
      Resource.transaction do
        image_name_new = Resource.resetimage r.avatar_file_name, r.id
        if image_name_new
          r.avatar_file_name=image_name_new
          r.save!
        end
      end
    end
    ResourceCollection.all.each do |rc|
      ResourceCollection.transaction do
        image_name_new = Resource.resetimage rc.avatar_file_name, rc.id
        if image_name_new
          rc.avatar_file_name=image_name_new
          rc.save!
        end
      end
    end

  end

  def Resource.resetimage(imagename, id)
    begin
      filedir = Resource.getdir_by_id("#{Rails.root}/public/upload/", id)
      medium = "#{filedir}medium/"
      middle = "#{filedir}middle/"
      original = "#{filedir}original/"
      thumb = "#{filedir}thumb/"
      medium_name = "#{medium}#{imagename}"
      middle_name = "#{middle}#{imagename}"
      original_name = "#{original}#{imagename}"
      thumb_name = "#{thumb}#{imagename}"
      if File.exist?(medium_name) &&
          File.exist?(middle_name) &&
          File.exist?(original_name) &&
          File.exist?(thumb_name)
        image_name_new = Resource.getname(medium, imagename)
        File.rename medium_name, medium+image_name_new
        File.rename middle_name, middle+image_name_new
        File.rename original_name, original+image_name_new
        File.rename thumb_name, thumb+image_name_new
        return image_name_new
      else
        return nil
      end
    rescue
      return nil
    end
  end
end
