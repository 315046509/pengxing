class ClientsController < ApplicationController
  def index
    # 公司告示
    @category_2_name = Journalism.question_category_name(2)
    @category_2_journalism = Journalism.where({:question_category_id => 2}, "title <> ''").order_ct_desc.page(params[:page]).per(1)

    @customers = Customer.order_ct_desc.page(params[:page]).per(60)
  end

  def show
    # 公司告示
    @category_2_name = Journalism.question_category_name(2)
    @category_2_journalism = Journalism.where({:question_category_id => 2}, "title <> ''").order_ct_desc.page(params[:page]).per(1)

    @customer = Customer.find params[:id]
  end
end
