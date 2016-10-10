class FridgesController < ApplicationController
  before_action :set_fridge, only: [:show, :edit, :update, :destroy]

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

    # Never trust parameters from the scary internet, only allow the white list through.
    def fridge_params
      params.require(:fridge).permit(:name, :description)
    end
end
