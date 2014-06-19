class DaozhasController < ApplicationController
  def index
    # 公司告示
    @category_2_name = Journalism.question_category_name(2)
    @category_2_journalism = Journalism.where({:question_category_id => 2}, "title <> ''").order_ct_desc.page(params[:page]).per(1)
    #道闸点位
    @roll = Daozha.all.order("created_at DESC").page(params[:page]).per(15)
  end

  def show
    # 公司告示
    @category_2_name = Journalism.question_category_name(2)
    @category_2_journalism = Journalism.where({:question_category_id => 2}, "title <> ''").order_ct_desc.page(params[:page]).per(1)

    @roll = Daozha.find params[:id]
    #推荐道闸点位
    @rolls = Daozha.all.order("created_at DESC").page(params[:page]).per(10)
  end

  def chaoyang
    # 公司告示
    @category_2_name = Journalism.question_category_name(2)
    @category_2_journalism = Journalism.where({:question_category_id => 2}, "title <> ''").order_ct_desc.page(params[:page]).per(1)
    #道闸点位
    @category_1_dzname = Daozha.question_category_name(0)
    @category_1_daozha = Daozha.where({:question_category_id => 0}, "title <> ''").order_ct_desc.page(params[:page]).per(15)
  end

  def nanguan
    # 公司告示
    @category_2_name = Journalism.question_category_name(2)
    @category_2_journalism = Journalism.where({:question_category_id => 2}, "title <> ''").order_ct_desc.page(params[:page]).per(1)
    #道闸点位
    @category_2_dzname = Daozha.question_category_name(1)
    @category_2_daozha = Daozha.where({:question_category_id => 1}, "title <> ''").order_ct_desc.page(params[:page]).per(15)
  end

  def luyuan
    # 公司告示
    @category_2_name = Journalism.question_category_name(2)
    @category_2_journalism = Journalism.where({:question_category_id => 2}, "title <> ''").order_ct_desc.page(params[:page]).per(1)
    #道闸点位
    @category_3_dzname = Daozha.question_category_name(2)
    @category_3_daozha = Daozha.where({:question_category_id => 2}, "title <> ''").order_ct_desc.page(params[:page]).per(15)
  end

  def kuancheng
    # 公司告示
    @category_2_name = Journalism.question_category_name(2)
    @category_2_journalism = Journalism.where({:question_category_id => 2}, "title <> ''").order_ct_desc.page(params[:page]).per(1)
    #道闸点位
    @category_4_dzname = Daozha.question_category_name(3)
    @category_4_daozha = Daozha.where({:question_category_id => 3}, "title <> ''").order_ct_desc.page(params[:page]).per(15)
  end

  def erdao
    # 公司告示
    @category_2_name = Journalism.question_category_name(2)
    @category_2_journalism = Journalism.where({:question_category_id => 2}, "title <> ''").order_ct_desc.page(params[:page]).per(1)
    #道闸点位
    @category_5_dzname = Daozha.question_category_name(4)
    @category_5_daozha = Daozha.where({:question_category_id => 4}, "title <> ''").order_ct_desc.page(params[:page]).per(15)
  end

  def shuangyang
    # 公司告示
    @category_2_name = Journalism.question_category_name(2)
    @category_2_journalism = Journalism.where({:question_category_id => 2}, "title <> ''").order_ct_desc.page(params[:page]).per(1)
    #道闸点位
    @category_6_dzname = Daozha.question_category_name(5)
    @category_6_daozha = Daozha.where({:question_category_id => 5}, "title <> ''").order_ct_desc.page(params[:page]).per(15)
  end

  def jingkai
    # 公司告示
    @category_2_name = Journalism.question_category_name(2)
    @category_2_journalism = Journalism.where({:question_category_id => 2}, "title <> ''").order_ct_desc.page(params[:page]).per(1)
    #道闸点位
    @category_7_dzname = Daozha.question_category_name(6)
    @category_7_daozha = Daozha.where({:question_category_id => 6}, "title <> ''").order_ct_desc.page(params[:page]).per(15)
  end

  def gaoxin
    # 公司告示
    @category_2_name = Journalism.question_category_name(2)
    @category_2_journalism = Journalism.where({:question_category_id => 2}, "title <> ''").order_ct_desc.page(params[:page]).per(1)
    #道闸点位
    @category_8_dzname = Daozha.question_category_name(7)
    @category_8_daozha = Daozha.where({:question_category_id => 7}, "title <> ''").order_ct_desc.page(params[:page]).per(15)
  end

  def qichecheng
    # 公司告示
    @category_2_name = Journalism.question_category_name(2)
    @category_2_journalism = Journalism.where({:question_category_id => 2}, "title <> ''").order_ct_desc.page(params[:page]).per(1)
    #道闸点位
    @category_9_dzname = Daozha.question_category_name(8)
    @category_9_daozha = Daozha.where({:question_category_id => 8}, "title <> ''").order_ct_desc.page(params[:page]).per(15)
  end

  def jingyue
    # 公司告示
    @category_2_name = Journalism.question_category_name(2)
    @category_2_journalism = Journalism.where({:question_category_id => 2}, "title <> ''").order_ct_desc.page(params[:page]).per(1)
    #道闸点位
    @category_10_dzname = Daozha.question_category_name(9)
    @category_10_daozha = Daozha.where({:question_category_id => 9}, "title <> ''").order_ct_desc.page(params[:page]).per(15)
  end

  def changchunzhoubian
    # 公司告示
    @category_2_name = Journalism.question_category_name(2)
    @category_2_journalism = Journalism.where({:question_category_id => 2}, "title <> ''").order_ct_desc.page(params[:page]).per(1)
    #道闸点位
    @category_11_dzname = Daozha.question_category_name(10)
    @category_11_daozha = Daozha.where({:question_category_id => 10}, "title <> ''").order_ct_desc.page(params[:page]).per(15)
  end
end
