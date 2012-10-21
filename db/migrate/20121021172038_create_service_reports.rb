class CreateServiceReports < ActiveRecord::Migration
  def change
    create_table :service_reports do |t|
      t.decimal :lat
      t.decimal :lng
      t.string :address
      t.string :email
      t.string :prefered_response_method
      t.integer :service_report_category_id
      t.boolean :commendation
      t.integer :axis_id
      t.string :axis_type
      t.integer :vehicle_id
      t.boolean :responded
      t.string :response_text
      t.string :response_reply_to

      t.timestamps
    end
  end
end
