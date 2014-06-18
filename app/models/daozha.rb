class Daozha < ActiveRecord::Base
  validates :name, :presence => {:message => "请填写小区名称"}
end
