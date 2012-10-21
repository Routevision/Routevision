class ServiceReportsController < ApplicationController
  def create
    @service_report = ServiceReport.create
    service_report = {}
    service_report[:axis] = SfTransit::Leg.find params[:service_report][:axis_id]
    service_report[:email] = params[:service_report][:email]
    service_report[:report_text] = params[:service_report][:report_text]
    @service_report.update_attributes service_report
    render :json => @service_report
  end

  def update
    @service_report = ServiceReport.find params[:service_report][:id]
    [:id, :route, :created_at, :updated_at].each do |key|
      params[:service_report].delete key
    end
    @service_report.update_attributes params[:service_report]
    render :json => @service_report
  end

  def new
    @service_report = ServiceReport.new
    if params[:vehicle_id]
      @service_report.update_attribute :vehicle_id, params[:vehicle_id]
    end
  end

  def index
    render :json => ServiceReport.all
  end

  def show
    service_report = ServiceReport.find params[:id] rescue nil
    render_json service_report
  end
end
