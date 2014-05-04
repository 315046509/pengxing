class OursController < ApplicationController
  def index
    # 公司告示
    @category_2_name = Journalism.question_category_name(2)
    @category_2_journalism = Journalism.where({:question_category_id => 2}, "title <> ''").order_ct_desc.page(params[:page]).per(1)

  end

  # 加入我们（招聘）
  def joinus
    # 招聘信息
    @jobs = Job.order_ct_desc.page(params[:page]).per(3)
    # 公司告示
    @category_2_name = Journalism.question_category_name(2)
    @category_2_journalism = Journalism.where({:question_category_id => 2}, "title <> ''").order_ct_desc.page(params[:page]).per(1)

  end

  # 精英团队
  def elite_team
    # 公司告示
    @category_2_name = Journalism.question_category_name(2)
    @category_2_journalism = Journalism.where({:question_category_id => 2}, "title <> ''").order_ct_desc.page(params[:page]).per(1)

  end

  # 最新动态（新闻）
  def journalism
    # 公司告示
    @category_2_name = Journalism.question_category_name(2)
    @category_2_journalism = Journalism.where({:question_category_id => 2}, "title <> ''").order_ct_desc.page(params[:page]).per(1)

    @journalisms = Journalism.order_ct_desc.page(params[:page]).per(10)
  end

  # 最新动态（新闻）
  def journalism_show
    # 公司告示
    @category_2_name = Journalism.question_category_name(2)
    @category_2_journalism = Journalism.where({:question_category_id => 2}, "title <> ''").order_ct_desc.page(params[:page]).per(1)

    @journalism = Journalism.find params[:id]
  end

  # 招聘信息
  def user_create
    @member = Member.new(
        :name => params[:member][:name],
        :sex => params[:member][:sex],
        :age => params[:member][:age],
        :card_id => params[:member][:card_id],
        :tel => params[:member][:tel],
        :address => params[:member][:address],
        :experience => params[:member][:experience],
        :job => params[:member][:job]
    )
    if @member.save
      flash[:error_msg]="申请成功，审核后，我们将电话通知您面试"
      redirect_to joinus_ours_path and return
    else
      flash[:error_msg]="申请失败，请核实信息是否有误"
      redirect_to :back and return
    end
  end

  def daozha
    # 公司告示
    @category_2_name = Journalism.question_category_name(2)
    @category_2_journalism = Journalism.where({:question_category_id => 2}, "title <> ''").order_ct_desc.page(params[:page]).per(1)
  end
end
