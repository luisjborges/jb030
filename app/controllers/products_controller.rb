class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def show; end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to product_path(@product), notice: "Product was succesfully published."
    else
      render :new
    end
  end

  def edit; end

  def update
    if @product.update(product_params)
      redirect_to product_path(@product), notice: "Product was succesfully updated."
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path, notice: "Product was succesfully deleted."
  end

  def top
    @product = Product.where(price: 40)
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :color, :fabric, :delivery, :size, :photo)
  end

  def set_product
    @product = Product.find(params[:id])
  end

end
