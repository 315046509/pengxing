class OursController < ApplicationController
  def index
    # 公司告示
    @category_2_name = Journalism.question_category_name(2)
    @category_2_journalism = Journalism.where({:question_category_id => 2}, "title <> ''").order_ct_desc.page(params[:page]).per(1)

  end

  # 加入我们（招聘）
  def joinus
    # 招聘信息
    @jobs = Job.order_ct_desc.page(params[:page]).per(1)
    # 公司告示
    @category_2_name = Journalism.question_category_name(2)
    @category_2_journalism = Journalism.where({:question_category_id => 2}, "title <> ''").order_ct_desc.page(params[:page]).per(1)

  end

  # 加入我们（高管）
  def joinus_a
    # 招聘高管
    @category_1_job = Job.question_category_name(1)
    @category_1_job = Job.where({:question_category_id => 1}, "title <> ''").order_ct_desc.page(params[:page]).per(1)
    # 公司告示
    @category_2_name = Journalism.question_category_name(2)
    @category_2_journalism = Journalism.where({:question_category_id => 2}, "title <> ''").order_ct_desc.page(params[:page]).per(1)

  end

  # 加入我们（网络）
  def joinus_b
    # 招聘网络
    @category_2_job = Job.question_category_name(2)
    @category_2_job = Job.where({:question_category_id => 2}, "title <> ''").order_ct_desc.page(params[:page]).per(1)
    # 公司告示
    @category_2_name = Journalism.question_category_name(2)
    @category_2_journalism = Journalism.where({:question_category_id => 2}, "title <> ''").order_ct_desc.page(params[:page]).per(1)

  end

  # 加入我们（销售）
  def joinus_c
    # 招聘销售
    @category_3_job = Job.question_category_name(3)
    @category_3_job = Job.where({:question_category_id => 3}, "title <> ''").order_ct_desc.page(params[:page]).per(1)
    # 公司告示
    @category_2_name = Journalism.question_category_name(2)
    @category_2_journalism = Journalism.where({:question_category_id => 2}, "title <> ''").order_ct_desc.page(params[:page]).per(1)

  end

  # 加入我们（行政）
  def joinus_d
    # 招聘行政
    @category_4_job = Job.question_category_name(4)
    @category_4_job = Job.where({:question_category_id => 4}, "title <> ''").order_ct_desc.page(params[:page]).per(1)
    # 公司告示
    @category_2_name = Journalism.question_category_name(2)
    @category_2_journalism = Journalism.where({:question_category_id => 2}, "title <> ''").order_ct_desc.page(params[:page]).per(1)

  end

  # 加入我们（工程）
  def joinus_e
    # 招聘工程
    @category_5_job = Job.question_category_name(5)
    @category_5_job = Job.where({:question_category_id => 5}, "title <> ''").order_ct_desc.page(params[:page]).per(1)
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
    # 全部
    @journalisms = Journalism.order_ct_desc.page(params[:page]).per(10)
  end

  # 新闻动态
  def news_trends
    # 公司告示
    @category_2_name = Journalism.question_category_name(2)
    @category_2_journalism = Journalism.where({:question_category_id => 2}, "title <> ''").order_ct_desc.page(params[:page]).per(1)
    # 新闻动态
    @journalisms_name = Journalism.question_category_name(1)
    @journalisms_1_journalism = Journalism.where({:question_category_id => 1}, "title <> ''").order_ct_desc.page(params[:page]).per(10)
  end

  # 公告动态
  def dynamic_announcement
    # 公司告示
    @category_2_name = Journalism.question_category_name(2)
    @category_2_journalism = Journalism.where({:question_category_id => 2}, "title <> ''").order_ct_desc.page(params[:page]).per(1)
    # 公告动态
    @journalisms_name = Journalism.question_category_name(2)
    @journalisms_2_journalism = Journalism.where({:question_category_id => 2}, "title <> ''").order_ct_desc.page(params[:page]).per(10)
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
      flash[:error_msg]="您已申请成功，请您耐心等待。审核后，我们将致电通知您面试时间！"
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
