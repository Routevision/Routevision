# This migration comes from sf_transit (originally 20121009035404)
class CreateSfTransitLegStops < ActiveRecord::Migration
  def change
    create_table :sf_transit_leg_stops do |t|
      t.integer :stop_id
      t.integer :leg_id

      t.timestamps
    end
  end
end
