# This migration comes from sf_transit (originally 20121009035423)
class CreateSfTransitStops < ActiveRecord::Migration
  def change
    create_table :sf_transit_stops do |t|
      t.decimal :lat, :precision => 15, :scale => 10
      t.decimal :lng, :precision => 15, :scale => 10
      t.string :address
      t.string :title
      t.integer :transfer_id

      t.timestamps
    end
  end
end
