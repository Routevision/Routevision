# This migration comes from sf_transit (originally 20121009040021)
class CreateSfTransitTransfers < ActiveRecord::Migration
  def change
    create_table :sf_transit_transfers do |t|
      t.string :title

      t.timestamps
    end
  end
end
