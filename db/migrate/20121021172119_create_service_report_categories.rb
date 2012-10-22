class CreateServiceReportCategories < ActiveRecord::Migration
  def change
    create_table :service_report_categories do |t|
      t.integer :category_id
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
