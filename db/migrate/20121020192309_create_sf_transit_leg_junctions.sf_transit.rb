# This migration comes from sf_transit (originally 20121009031452)
class CreateSfTransitLegJunctions < ActiveRecord::Migration
  def change
    create_table :sf_transit_leg_junctions do |t|
      t.integer :junction_id
      t.integer :leg_id
      t.integer :weight

      t.timestamps
    end
  end
end
