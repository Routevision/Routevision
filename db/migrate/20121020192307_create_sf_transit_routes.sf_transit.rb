# This migration comes from sf_transit (originally 20121009025530)
class CreateSfTransitRoutes < ActiveRecord::Migration
  def change
    create_table :sf_transit_routes do |t|
      t.string :abbr
      t.string :agency
      t.string :title

      t.timestamps
    end
  end
end
