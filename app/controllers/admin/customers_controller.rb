class Admin::CustomersController < Admin::MainController
  layout 'admin'
  before_action :customers_params, :only => [:create]
  before_filter :get_customers, :only => [:destroy]

  def index
    @customers = Customer.all.order("id desc").page(params[:page]).per(10)
  end

  def new
    @customer = Customer.new
  end

  def create
    if request.post?
      if params[:customer]
        title = params[:customer][:title]
        avatar = params[:customer][:avatar]
        description = params[:customer][:description]
        imagename = avatar.original_filename
        avatar.original_filename = Time.now.strftime("%Y%m%d%h%m%s")<<rand(99999).to_s<<imagename[imagename.length-4, 4]
        if !avatar.blank? && !description.blank? && !title.blank?
          rc = Customer.create(:avatar => avatar, :title => title, :description => description)
          if rc.valid?
          else
            msg = ""
            rc.errors.full_messages.each { |error| msg+= error }
            flash[:error]= msg
            redirect_to :back and return
          end
          redirect_to admin_customers_path and return
        else
          flash[:error_msg]="添加失败，请检查添加项是否有空值！"
          redirect_to :back
        end
      end
    end
  end

  def show
    @customer = Customer.find params[:id]
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @job = Customer.find(params[:id])
    update_category = @job.update_attributes(
        :title => params[:customer][:title],
        :description => params[:customer][:description]
    )
    if update_category
      respond_to do |job|
        job.html {
          redirect_to admin_customers_path and return
        }
      end
    end
  end

  def destroy
    @customer = Customer.find params[:id]
    Customer.deletefile(@customer.id)
    @customer.destroy
    redirect_to admin_customers_path and return
  end

  private
  def get_customers
    @customer = Customer.where(:id => params[:id]).first
  end

  def customers_params
    params.require(:customer).permit(:avatar, :description, :title)
  end
end
