class FridgeItemsController < ApplicationController
  before_action :set_fridge

  def create
    @fridge_item = @fridge.fridge_items.create(fridge_item_params)

    redirect_to @fridge
  end

  private

  def set_fridge
    @fridge = Fridge.find(params[:fridge_id])
  end

  def fridge_item_params
    params[:fridge_item].permit(:name, :use_by_date)
  end

end