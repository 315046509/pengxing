class CasesController < ApplicationController
  def index
    # 公司告示
    @category_2_name = Journalism.question_category_name(2)
    @category_2_journalism = Journalism.where({:question_category_id => 2}, "title <> ''").order_ct_desc.page(params[:page]).per(1)

    # 全部案例
    @cases = Case.order_ct_desc.page(params[:page]).per(12)
  end

  # 显示页
  def show
    # 公司告示
    @category_2_name = Journalism.question_category_name(2)
    @category_2_journalism = Journalism.where({:question_category_id => 2}, "title <> ''").order_ct_desc.page(params[:page]).per(1)

    @case = Case.find params[:id]
  end

  # 档车杆
  def dangche
    # 公司告示
    @category_2_name = Journalism.question_category_name(2)
    @category_2_journalism = Journalism.where({:question_category_id => 2}, "title <> ''").order_ct_desc.page(params[:page]).per(1)

    # 档车杆分类
    @category_2_name = Case.question_category_name(1)
    @category_2_journalism = Case.where({:question_category_id => 1}, "title <> ''").order_ct_desc.page(params[:page]).per(12)

  end

  # 龙嘉机场
  def longjia
    # 公司告示
    @category_2_name = Journalism.question_category_name(2)
    @category_2_journalism = Journalism.where({:question_category_id => 2}, "title <> ''").order_ct_desc.page(params[:page]).per(1)

    # 龙嘉机场分类
    @category_2_name = Case.question_category_name(2)
    @category_2_journalism = Case.where({:question_category_id => 2}, "title <> ''").order_ct_desc.page(params[:page]).per(12)

  end

  # 微信
  def weixin
    # 公司告示
    @category_2_name = Journalism.question_category_name(2)
    @category_2_journalism = Journalism.where({:question_category_id => 2}, "title <> ''").order_ct_desc.page(params[:page]).per(1)

    # 微信
    @category_2_name = Case.question_category_name(3)
    @category_2_journalism = Case.where({:question_category_id => 3}, "title <> ''").order_ct_desc.page(params[:page]).per(12)

  end
end
