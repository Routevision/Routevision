# This migration comes from sf_transit (originally 20121008002646)
class CreateSfTransitJunctions < ActiveRecord::Migration
  def change
    create_table :sf_transit_junctions do |t|
      t.decimal :lat, :precision => 15, :scale => 10
      t.decimal :lng, :precision => 15, :scale => 10
      t.text :name
      t.string :address

      t.timestamps
    end
  end
end
