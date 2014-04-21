class Admin::JobController < Admin::MainController
  layout 'admin'

  def index
    @jobs = Job.order_ct_desc.page(params[:page]).per(10)
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(
        :title => params[:job][:title],
        :description => params[:job][:description]
    )
    if @job.save
      flash[:note] = "创建成功"
      redirect_to admin_job_index_path and return
    else
      flash[:error_msg] = @job.errors.values.join(";    ")
      redirect_to :back and return
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    update_category = @job.update_attributes(
        :title => params[:job][:title],
        :description => params[:job][:description]
    )
    if update_category
      respond_to do |job|
        job.html {
          redirect_to admin_job_index_path and return
        }
      end
    end
  end

  def show
    @job = Job.find params[:id]
  end

  #   删除
  def destroy
    @job = Job.find(params[:id])
    flash[:error_msg] = @job.destroy ? "删除成功" : "请稍后再试"
    redirect_to admin_job_index_path and return
  end
end
