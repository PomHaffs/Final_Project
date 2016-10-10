class FridgeItemsController < ApplicationController
  before_action :set_fridge
  before_action :set_fridge_item, except: [:create]

  def create
    @fridge_item = @fridge.fridge_items.create(fridge_item_params)

    redirect_to user_fridge_path(@fridge.user, @fridge)
  end

  def destroy
    if @fridge_item.destroy
      flash[:success] = "Fridge item deleted."
    else flash[:error] = "Fridge item NOT deleted."
    end
    redirect_to user_fridge_path(@fridge.user, @fridge)
  end

  def item_used
    @fridge_item.update_attribute(:item_used, Time.now)
    redirect_to user_fridge_path(@fridge.user, @fridge), notice: "Item now used"
  end

  private

    def set_fridge
      @fridge = Fridge.find(params[:fridge_id])
    end

    def set_fridge_item
      @fridge_item = @fridge.fridge_items.find(params[:id])
    end

    def fridge_item_params
      params[:fridge_item].permit(:name, :use_by_date)
    end

end
