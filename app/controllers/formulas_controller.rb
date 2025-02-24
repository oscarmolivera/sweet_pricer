class FormulasController < ApplicationController
  before_action :set_formula, only: %i[ show edit update destroy ]

  # GET /formulas or /formulas.json
  def index
    @formulas = Formula.all
  end

  # GET /formulas/1 or /formulas/1.json
  def show
  end

  # GET /formulas/new
  def new
    @formula = Formula.new
  end

  # GET /formulas/1/edit
  def edit
  end

  # POST /formulas or /formulas.json
  def create
    @formula = Formula.new(formula_params)

    respond_to do |format|
      if @formula.save
        format.html { redirect_to @formula, notice: "Formula was successfully created." }
        format.json { render :show, status: :created, location: @formula }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @formula.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /formulas/1 or /formulas/1.json
  def update
    respond_to do |format|
      if @formula.update(formula_params)
        format.html { redirect_to @formula, notice: "Formula was successfully updated." }
        format.json { render :show, status: :ok, location: @formula }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @formula.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /formulas/1 or /formulas/1.json
  def destroy
    @formula.destroy!

    respond_to do |format|
      format.html { redirect_to formulas_path, status: :see_other, notice: "Formula was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_formula
      @formula = Formula.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def formula_params
      params.expect(formula: [ :unit, :quantity, :recipe_id, :ingredient_id ])
    end
end
