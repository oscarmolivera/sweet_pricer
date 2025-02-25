class FormulasController < ApplicationController
  before_action :set_recipe
  before_action :set_formula, only: [:edit, :update, :destroy]

  def show
    @formula_ingredients = @recipe.formulas.includes(:ingredient)
  end

  def new
    @formula = @recipe.formulas.new
    @ingredients = Ingredient.all # List all available ingredients
  end

  def create
    @formula = @recipe.formulas.new(formula_params)

    if @formula.save
      redirect_to recipe_formulas_path(@recipe), notice: "Ingrediente agregado a la receta con éxito."
    else
      @ingredients = Ingredient.all
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @ingredients = Ingredient.all
  end

  def update
    if @formula.update(formula_params)
      redirect_to recipe_formula_path(@recipe), notice: "Ingrediente actualizado con éxito."
    else
      @ingredients = Ingredient.all
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @formula.destroy
    redirect_to recipe_formula_path(@recipe), notice: "Ingrediente eliminado con éxito."
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def set_formula
    @formula = @recipe.formulas.find(params[:id])
  end

  def formula_params
    params.require(:formula).permit(:ingredient_id, :quantity, :unit)
  end
end