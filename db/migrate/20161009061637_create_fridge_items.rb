class CreateFridgeItems < ActiveRecord::Migration
  def change
    create_table :fridge_items do |t|
      t.string :name
      t.date :use_by_date
      t.references :fridge, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
