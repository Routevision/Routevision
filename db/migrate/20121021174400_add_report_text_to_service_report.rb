class AddReportTextToServiceReport < ActiveRecord::Migration
  def change
    add_column :service_reports, :report_text, :string
  end
end
