class Backoffice::CategoriesController < ApplicationController
  before_action :authenticate_admin!

  layout "backoffice"

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params_category)

    respond_to do |format|
      if @category.save
        format.html { redirect_to backoffice_categories_path, notice: "Category (#{@category.description}) saved" }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    respond_to do |format|
      if @category.update(params_category)
        format.html { redirect_to backoffice_categories_path, notice: "Category (#{@category.description}) edited" }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy

  end

  private

  def params_category
    params.require(:category).permit(:description)
  end
end
