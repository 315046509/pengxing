class Admin::DaozhasController < Admin::MainController
  layout 'admin'
  before_action :roll_params, :only => [:create]
  before_filter :get_roll, :only => [:destroy]

  def index
    @roll = Daozha.all.order("created_at DESC").page(params[:page]).per(10)
  end

  def new
    @roll = Daozha.new
  end

  def create
    if request.post?
      if params[:daozha]
        avatar = params[:daozha][:avatar]
        name = params[:daozha][:name]
        address = params[:daozha][:address]
        number = params[:daozha][:number]
        access_conditions = params[:daozha][:access_conditions]
        media_form = params[:daozha][:media_form]
        question_category_id = params[:daozha][:question_category_id]
        imagename = avatar.original_filename
        avatar.original_filename = Time.now.strftime("%Y%m%d%h%m%s")<<rand(99999).to_s<<imagename[imagename.length-4, 4]
        if !avatar.blank? && !name.blank? && !address.blank? && !number.blank? && !access_conditions.blank? && !media_form.blank? && !question_category_id.blank?
          rc = Daozha.create(
              :avatar => avatar,
              :name => name,
              :address => address,
              :number => number,
              :access_conditions => access_conditions,
              :media_form => media_form,
              :question_category_id => question_category_id)
          if rc.valid?
          else
            msg = ""
            rc.errors.full_messages.each { |error| msg+= error }
            flash[:error]= msg
            redirect_to :back and return
          end
          redirect_to admin_daozhas_path and return
        else
          flash[:error_msg]="添加失败，请检查添加项是否有空值！"
          redirect_to :back and return
        end
      end
    end
  end

  def show
    @roll = Daozha.find params[:id]
  end


  def edit
    @case = Daozha.find(params[:id])
  end

  def update
    @job = Daozha.find(params[:id])
    update_category = @job.update_attributes(
        :name => params[:daozha][:name],
        :address => params[:daozha][:address],
        :number => params[:daozha][:number],
        :access_conditions => params[:daozha][:access_conditions],
        :media_form => params[:daozha][:media_form],
        :question_category_id => params[:daozha][:question_category_id])
    if update_category
      respond_to do |job|
        job.html {
          redirect_to admin_daozhas_path and return
        }
      end
    end
  end

  def destroy
    @roll = Daozha.find params[:id]
    Daozha.deletefile(@roll.id)
    @roll.destroy
    redirect_to admin_daozhas_path and return
  end

  private
  def get_roll
    @roll = Daozha.where(:id => params[:id]).first
  end

  def roll_params
    params.require(:daozha).permit(:avatar, :name, :address, :number, :access_conditions, :media_form, :question_category_id)
  end
end
