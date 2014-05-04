class Admin::AccountsController < Admin::MainController
  layout 'admin'
  #用户管理/用户列表
  def index
    @accounts = Member.order_ct_desc
    @accounts = @accounts.where("id = ?", params[:member_id]) unless params[:member_id].blank?
    @accounts = @accounts.where("name like ?", "%#{params[:name]}%") unless params[:name].blank?
    @accounts = @accounts.where("tel like ?", "%#{params[:tel]}%") unless params[:tel].blank?
    @accounts = @accounts.where("experience like ?", "%#{params[:experience]}%") unless params[:experience].blank?
    @accounts = @accounts.where("job like ?", "%#{params[:job]}%") unless params[:job].blank?
    @accounts = @accounts.page(params[:page]).per(20)
  end

  def show
    @account = Member.find params[:id]
  end

  #   删除
  def destroy
    @accounts = Member.find(params[:id])
    flash[:error_msg] = @accounts.destroy ? "删除成功" : "请稍后再试"
    redirect_to admin_accounts_path and return
  end
end

