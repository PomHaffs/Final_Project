# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# create_table "fridge_items", force: :cascade do |t|
#   t.string   "name"
#   t.date     "use_by_date"
#   t.integer  "fridge_id"
#   t.datetime "created_at",  null: false
#   t.datetime "updated_at",  null: false
#   t.date     "item_used"
# end
#
# add_index "fridge_items", ["fridge_id"], name: "index_fridge_items_on_fridge_id"
#
# create_table "fridges", force: :cascade do |t|
#   t.string   "name"
#   t.text     "description"
#   t.datetime "created_at",  null: false
#   t.datetime "updated_at",  null: false
#   t.integer  "user_id"
# end
#
# create_table "users", force: :cascade do |t|
#   t.string   "name"
#   t.string   "password_digest"
#   t.integer  "mobile"
#   t.string   "email"
#   t.datetime "created_at",      null: false
#   t.datetime "updated_at",      null: false
# end

User.destroy_all
u1 = User.create :name => "Tom", :mobile => "0413338695", :email => "FreshMeatApp@gmail.com", :password => "chicken", :password_confirmation => "chicken"

Fridge.destroy_all
f1 = Fridge.create :name => "Tom's Fridge", :description => "Sydney Flat"

FridgeItem.destroy_all
i1 = FridgeItem.create :name => "HAM", :use_by_date => "18/10/2016"
i2 = FridgeItem.create :name => "EGGS", :use_by_date => "15/10/2016"
i3 = FridgeItem.create :name => "POTATOES", :use_by_date => "16/10/2016"
i4 = FridgeItem.create :name => "TOMATOES", :use_by_date => "15/10/2016"
i5 = FridgeItem.create :name => "SALMON", :use_by_date => "14/10/2016"
i6 = FridgeItem.create :name => "BREAD", :use_by_date => "19/10/2016"
i7 = FridgeItem.create :name => "PEPPERS", :use_by_date => "20/10/2016"
i8 = FridgeItem.create :name => "MUSHROOMS", :use_by_date => "18/10/2016"

u1.fridges << f1

f1.fridge_items << i1 << i2 << i3 << i4 << i5 << i6 << i7 << i8
