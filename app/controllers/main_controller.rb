class MainController < ApplicationController
  def index
    # 新闻动态
    @category_1_name = Journalism.question_category_name(1)
    @category_1_journalism = Journalism.where({:question_category_id => 1}, "title <> ''").order_ct_desc.page(params[:page]).per(4)
    # 公司告示
    @category_2_name = Journalism.question_category_name(2)
    @category_2_journalism = Journalism.where({:question_category_id => 2}, "title <> ''").order_ct_desc.page(params[:page]).per(1)
    # 合作伙伴
    @customers = Customer.order_ct_desc.page(params[:page]).per(60)
  end
end
