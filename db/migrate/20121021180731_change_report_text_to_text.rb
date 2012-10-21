class ChangeReportTextToText < ActiveRecord::Migration
  def change
    change_column :service_reports, :report_text, :text
  end
end
