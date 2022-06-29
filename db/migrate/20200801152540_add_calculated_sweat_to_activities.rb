class AddCalculatedSweatToActivities < ActiveRecord::Migration[6.0]
  def change
    add_column :activities, :calculated_sweat, :decimal
  end
end
