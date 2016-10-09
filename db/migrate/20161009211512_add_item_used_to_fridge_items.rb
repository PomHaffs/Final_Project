class AddItemUsedToFridgeItems < ActiveRecord::Migration
  def change
    add_column :fridge_items, :item_used, :date
  end
end
