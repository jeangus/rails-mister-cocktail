class DosesController < ApplicationController
  before_action :set_dose, only: [:edit, :update, :destroy]
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new

  end

  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
      respond_to do |format|
      if @dose.save
        format.html { redirect_to cocktail_path(@dose.cocktail_id), notice: 'Dose was successfully created.' }
        format.json { render :show, status: :created, location: @dose }
      else
        format.html { render :new }
        format.json { render json: @dose.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def update
    respond_to do |format|
      if @dose.update(dose_params)
        format.html { redirect_to cocktail_path(@dose.cocktail_id), notice: 'Dose was successfully updated.' }
        format.json { render :show, status: :ok, location: @dose }
      else
        format.html { render :edit }
        format.json { render json: @dose.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @dose.destroy
    respond_to do |format|
      format.html { redirect_to cocktail_path(@dose), notice: 'Dose was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dose
      @dose = Dose.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dose_params
      params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
    end
end
