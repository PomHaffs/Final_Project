class CreateFridges < ActiveRecord::Migration
  def change
    create_table :fridges do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
