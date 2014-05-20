class Admin::ResourcesController < Admin::MainController
  layout 'admin'

  def index
    @res = Resource.order_ct_desc.page(params[:page]).per(10)
  end

  #上传页
  def upload
    @resource = Resource.new
  end

  def upfile
    @error_msg = ''
    if params[:resource]
      notvalidate = params[:resource][:title].blank? ||
          params[:resource][:down].nil? ||
          params[:resource][:description].blank?
      if  notvalidate
        flash[:error_msg]= "请填写完整的信息"
        respond_to do |r|
          r.html { redirect_to :back and return }
        end
      else
        @rey = Resource.new(
            :title => params[:resource][:title],
            :description => params[:resource][:description],
            :down => params[:resource][:down].original_filename
        )
        @rey.save!
        @rey.down = Resource.upload(@rey.id, params[:resource][:down])
        @rey.save!
        respond_to do |r|
          r.html {
            redirect_to admin_resources_path and return
          }
        end
      end

      flash[:error_msg]= Resource.message
      respond_to do |r|
        r.html { redirect_to :back and return }
      end
      #返回错误
    end
  end

  # 下载
  def download
    if resource=Resource.where(:id => params[:resource_id]).first
      downtrue = Resource.getdir_by_id("/upload/", resource.id)<<"downs/"<<resource.down
      downpath = "#{Rails.root}/public#{downtrue}"
      if File.exist?(downpath)
        down = Resource.getdir_by_id("/upload/", resource.id)<<"downs/"<<resource.down
        response.headers['X-Accel-Redirect'] = down
        response.headers['Content-Type'] = 'application/octet-stream'
        redirect_to down
        return
      else
        flash[:error]= "文件不存在"
      end
    else
      flash[:error]="下载出错，文件不存在"
    end
  end

  def destroy
    @resource = Resource.find params[:id]
    Resource.deletefile(@resource.id)
    @resource.destroy
    redirect_to admin_resources_path and return
  end

  private
  def set_resource
    @resource = Resource.find(params[:resource][:id])
  end

  def set_get_resource
    @resource = Resource.find(params[:id])
  end

  def upfile_resource_params
    params.require(:resource).permit(:description, :title, :down)
  end

  def edit_resource_params
    params.require(:resource).permit(:description, :title)
  end
end
