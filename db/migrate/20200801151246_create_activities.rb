class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.string :name
      t.decimal :before_weight
      t.decimal :before_weight_with_water
      t.decimal :after_weight
      t.decimal :after_weight_with_water
      t.datetime :date
      t.string :description

      t.timestamps
    end
  end
end
