class FridgesController < ApplicationController
  before_action :set_fridge, only: [:show, :edit, :update, :destroy]

  def display # /fridges/:fridge_id/display
    @fridge = Fridge.find(params[:fridge_id])
    @items = @fridge.fridge_items.limit(3).sort { |i| i.use_by_date }.reverse.map { |i| i.name }
    @user = User.find(params[:user_id])
    @recipe_data = @user.get_recipes( @items )
  end

  def index
    @fridges = Fridge.all
  end

  def show
  end

  def new
    @fridge = Fridge.new
  end

  def edit
  end

  def create
    @fridge = Fridge.new(fridge_params)
    @fridge.user_id = @current_user.id

    respond_to do |format|
      if @fridge.save
        format.html { redirect_to user_fridge_path(@current_user, @fridge),  notice: 'Fridge was successfully created.' }
        format.json { render :show, status: :created, location: @fridge }
      else
        format.html { render :new }
        format.json { render json: @fridge.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @fridge.update(fridge_params)
        format.html { redirect_to @fridge, notice: 'Fridge was successfully updated.' }
        format.json { render :show, status: :ok, location: @fridge }
      else
        format.html { render :edit }
        format.json { render json: @fridge.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @fridge.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Fridge was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fridge
      @fridge = Fridge.find(params[:id])
    end

    def fridge_params
      params.require(:fridge).permit(:name, :description)
    end
end
