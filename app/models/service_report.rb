class ServiceReport < ActiveRecord::Base
  attr_accessible :axis, :address, :axis_id, :axis_type, :service_report_category_id, :commendation, :email, :lat, :lng, :prefered_response_method, :report_text, :responded, :response_reply_to, :response_text, :vehicle_id
  attr_accessor :route
  has_one :service_report_category
  belongs_to :axis, :polymorphic => true

  reverse_geocoded_by :lat, :lng
  before_save do |sr|
    sr.reverse_geocode if sr.lat && sr.lng
  end

  ID_OPTIONS = { :as => :hidden }
  ROUTE_OPTIONS = { :collection => SfTransit::Route.all.collect {|r| [r.title, r.id]}, :prompt => 'Select Route'}
  AXIS_ID_OPTIONS = { :collection => SfTransit::Leg.all.map {|l| [l.title, {'data-value'.to_sym => l.id, :class => "route-#{l.route.id}"}]}, :prompt => 'Select Direction', :as => :select }
  SERVICE_REPORT_CATEGORY_ID_OPTIONS = { :collection => ServiceReportCategory.all.collect {|src| [src.title, src.id]}, :as => :select, :prompt => 'Select Category'}

  def options_for(field)
    const = "#{field.upcase}_OPTIONS"
    options = self.class.const_defined?(const) ? self.class.const_get(const) : {}
    label_text = field.to_s
    label_text = label_text.gsub /_/, " "
    label_text = label_text.capitalize
    { :placeholder => label_text, :prompt => label_text, :label => false }.merge options
  end

  def fields_for(step)
    if FORM_STEPS[step].nil?
      return [] 
    end
    fields = FORM_STEPS[step]
    fields.keys.sort { |a, b| fields[a] <=> fields[b] }
  end

  FORM_STEPS = [
    {
      :id => -1,
      :route => 1,
      :axis_id => 10,
      :email => 100,
      :service_report_category_id => 1000,
      :report_text => 100000,
      :email => 10000
    }
  ] 
end
