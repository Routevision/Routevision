class ServiceReport < ActiveRecord::Base
  attr_accessible :address, :axis_id, :axis_type, :service_report_category_id, :commendation, :email, :lat, :lng, :prefered_response_method, :responded, :response_reply_to, :response_text, :vehicle_id
  has_one :service_report_category
  belongs_to :axis, :polymorphic => true
end
