class DaozhasController < ApplicationController
  def index
    # 公司告示
    @category_2_name = Journalism.question_category_name(2)
    @category_2_journalism = Journalism.where({:question_category_id => 2}, "title <> ''").order_ct_desc.page(params[:page]).per(1)
    #道闸点位
    @roll = Daozha.all.order("created_at DESC").page(params[:page]).per(15)
  end
end
