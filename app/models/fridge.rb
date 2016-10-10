class Fridge < ActiveRecord::Base
  has_many :fridge_items
  belongs_to :user
end
