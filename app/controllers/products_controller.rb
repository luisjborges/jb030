class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :voucher, :shirt]
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
    @products = policy_scope(Product).order(created_at: :desc)
  end

  def show
    @order = Order.new
  end

  def new
    @product = Product.new
    authorize @product
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    authorize @product
    @product.save

    if @product.save
      create_pictures
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

  def voucher
    @products = Product.where(sku: 1)
    authorize @products
  end

  def shirt
    @products = Product.where(sku: 2)
    authorize @products
  end

  private

  def product_params
    params.require(:product).permit(:sku, :name, :description, :price_cents, :color, :fabric, :delivery, :size, :note, :quantity, :images)
  end

  def set_product
    @product = Product.find(params[:id])
    authorize @product
  end

  def create_pictures
    photos = params.dig(:product, :images) || []
    photos.each do |image|
      @product.pictures.create(image: image)
    end
  end

end
