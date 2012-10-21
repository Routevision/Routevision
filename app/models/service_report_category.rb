class ServiceReportCategory < ActiveRecord::Base
  attr_accessible :category_id, :description, :title
  belongs_to :service_report
end
