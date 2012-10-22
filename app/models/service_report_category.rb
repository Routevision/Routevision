class ServiceReportCategory < ActiveRecord::Base
  attr_accessible :category_id, :description, :title, :code
  has_many :service_reports
end
