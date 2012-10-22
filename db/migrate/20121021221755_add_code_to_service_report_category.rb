class AddCodeToServiceReportCategory < ActiveRecord::Migration
  def change
    add_column :service_report_categories, :code, :integer
  end
end
