class FridgeItem < ActiveRecord::Base
  belongs_to :fridge

  def item_used?
    !item_used.blank?
  end
end
