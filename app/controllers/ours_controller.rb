class OursController < ApplicationController
  def index
    # 公司告示
    @category_2_name = Journalism.question_category_name(2)
    @category_2_journalism = Journalism.where({:question_category_id => 2}, "title <> ''").order_ct_desc.page(params[:page]).per(1)

  end

  # 加入我们（招聘）
  def joinus
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
      flash[:error_msg] = "申请成功！"
      redirect_to joinus_ours_path and return
    else
      flash[:error_msg] = @member.errors.values.join('\r')
      redirect_to :back and return
    end
  end

  # 手机号重复验证
  # 如果返回true   可以使用
  # 如果返回false   不可以使用
  def check_login
    tel = params[:member][:tel]
    render :text => Member.check_login_exist(tel) ? "false" : "true"
  end

  # 身份证重复验证
  # 如果返回true   可以使用
  # 如果返回false   不可以使用
  def check_card
    card_id = params[:member][:card_id]
    render :text => Member.check_card_exist(card_id) ? "false" : "true"
  end
end
